//
//  RApp.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/24/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

protocol Meta {
    static func url()->String
}

class RApp: Object {
    
    dynamic var id : String = ""
    dynamic var name : String = ""
    dynamic var imageURL : String? = nil
    dynamic var summary : String = ""
    dynamic var price : RAppPrice? = nil
    dynamic var contentType : String = ""
    dynamic var rights : String = ""
    dynamic var title : String = ""
    dynamic var href : String = ""
    dynamic var artist : RArtist? = nil
    dynamic var category : RAppCategory? = nil
    dynamic var releaseDate : String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(_ map: Map) {
        self.init()
    }
}

//MARK: - Mappable

extension RApp : Mappable{
    func mapping(map: Map) {
        id <- map["id.attributes.im:id"]
        name <- map["im:name.label"]
        if let lastImage = (map["im:image"].currentValue?.lastObject as? [String: AnyObject]){
            imageURL = lastImage["label"] as? String
        }
        summary <- map["summary.label"]
        price = Mapper<RAppPrice>().map(map["im:price"].currentValue)
        price?.appID = id
        contentType <- map["im:contentType.attributes.label"]
        rights <- map["rights.label"]
        title <- map["title.label"]
        href <-  map["link.attributes.href"]
        artist = Mapper<RArtist>().map(map["im:artist"].currentValue)
        category = Mapper<RAppCategory>().map(map["category"].currentValue)
        releaseDate <-  map["im:releaseDate.label"]
    }
}

//MARK: - Meta

extension RApp : Meta{
    static func url()->String {
        return "https://itunes.apple.com/us/rss/topfreeapplications/limit=20/json"
    }
}