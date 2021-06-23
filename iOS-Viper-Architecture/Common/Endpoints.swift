//
//  Endpoints.swift
//  iOS-Viper-Architecture
//
//  Created by Amir Samir on 23/06/21.
//  
//

import Foundation

struct API {
    static let baseUrl = "https://api.football-data.org/v2/"
    
   
    
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Posts: Endpoint {
        case teamList(id:Int)
        
        public var path: String {
            switch self {
            case .teamList(let id): return "competitions/\(id)/teams"
            }
        }
        
        public var url: String {
            switch self {
            case .teamList: return "\(API.baseUrl)\(path)"
            }
        }
        
        
    }
}
