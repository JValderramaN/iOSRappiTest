//
//  RAppPrice.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/24/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class RAppPrice : Object{
    
    dynamic var amount : String = ""
    dynamic var currency : String = ""
    dynamic var appID : String = ""
    
    override static func primaryKey() -> String? {
        return "appID"
    }
    
    required convenience init?(_ map: Map) {
        self.init()
    }
}

//MARK: - Mappable

extension RAppPrice : Mappable{
    func mapping(map: Map) {
        amount <- map["attributes.amount"]
        currency <- map["attributes.currency"]
    }
}