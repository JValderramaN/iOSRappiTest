//
//  RAppCategory.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/24/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class RAppCategory: Object {
    
    dynamic var id : String = ""
    dynamic var label : String = ""
    dynamic var href : String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(_ map: Map) {
        self.init()
    }
}

//MARK: - Mappable

extension RAppCategory : Mappable{
    func mapping(map: Map) {
        id <- map["attributes.im:id"]
        label <- map["attributes.label"]
        href <- map["attributes.scheme"]
    }
}