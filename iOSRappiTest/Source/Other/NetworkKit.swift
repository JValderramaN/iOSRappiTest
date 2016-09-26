//
//  NetworkKit.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/24/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RealmSwift
import SystemConfiguration

class NetworkKit {
    
    static func fetchData <T: Object where T:Mappable, T:Meta> (type: T.Type, success:() -> Void, fail:(error:NSError)->Void)->Void {
        Alamofire.request(Method.GET, type.url())
            .responseJSON { response in
                
                switch response.result {
                case .Success:
                    
                    guard let json = response.result.value as? [String: AnyObject]
                        , let feed = json["feed"] as? [String: AnyObject]
                        , let entry = feed["entry"] as? [AnyObject]
                        else{
                            return
                    }
                    
                    if let apps = Mapper<RApp>().mapArray(entry){
                        do {
                            let realm = try Realm()
                            try realm.write {
                                for app in apps {
                                    realm.add(app,update: true)
                                }
                            }
                        } catch let error as NSError {
                            fail(error: error)
                        }
                        success()
                    }
                case .Failure(let error):
                    fail(error: error)
                }
        }
    }
    
    static func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
}