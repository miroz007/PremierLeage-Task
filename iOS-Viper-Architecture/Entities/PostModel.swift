//
//  PostModel.swift
//  iOS-Viper-Architecture
//
//  Created by Amir Samir on 23/06/21.
//  
//

import Foundation
import ObjectMapper

struct ResponseModel: Mappable {
    var teams = [PostModel]()
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        teams     <- map["teams"]
    }
    
}


struct PostModel {
    var id = 0
    var shortName = ""
    var crestUrl = ""
    
    var clubColors = ""
    var email = ""
    var founded = 0
    var name = ""
    var tla = ""
    var venue = ""
    var website = ""
    var phone = ""
    var address = ""
    
}

extension PostModel: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id             <- map["id"]
        shortName      <- map["shortName"]
        crestUrl       <- map["crestUrl"]
        
        address        <- map["address"]
        phone          <- map["phone"]
        clubColors     <- map["clubColors"]
        email          <- map["email"]
        founded        <- map["founded"]
        name           <- map["name"]
        tla            <- map["tla"]
        venue          <- map["venue"]
        website        <- map["website"]
        
    }
    
}
