//
//  PostListRemoteDataManager.swift
//  iOS-Viper-Architecture
//
//  Created by Amir Samir on 23/06/21.
//  
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class PostListRemoteDataManager:PostListRemoteDataManagerInputProtocol {
 
    var remoteRequestHandler: PostListRemoteDataManagerOutputProtocol?
    
    let headers = ["X-Auth-Token" : "0e4493b922454b678272fd028b736e5a"]
    
    func retrievePostList() {
        Alamofire
            .request(Endpoints.Posts.teamList(id: 2021).url, method: .get, headers: headers)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<ResponseModel>) in
                switch response.result {
                case .success(let response):
                    self.remoteRequestHandler?.onPostsRetrieved(response.teams)
                    
                case .failure( _):
                    self.remoteRequestHandler?.onError()
                }
            })
    }
    
}
