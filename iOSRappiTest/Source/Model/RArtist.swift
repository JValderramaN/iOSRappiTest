//
//  RArtist.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/24/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class RArtist: Object {
    
    dynamic var label : String = ""
    dynamic var href : String = ""
    
    override static func primaryKey() -> String? {
        return "href"
    }
    
    required convenience init?(_ map: Map) {
        self.init()
    }
}

//MARK: - Mappable

extension RArtist : Mappable{
    func mapping(map: Map) {
        label <- map["label"]
        href <- map["attributes.href"]
    }
}
