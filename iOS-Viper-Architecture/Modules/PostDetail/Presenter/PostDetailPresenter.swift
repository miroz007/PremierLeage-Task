//
//  PostDetailPresenter.swift
//  iOS-Viper-Architecture
//
//  Created by Amir Samir on 23/06/21.
//  
//

class PostDetailPresenter: PostDetailPresenterProtocol {
    
    weak var view: PostDetailViewProtocol?
    var wireFrame: PostDetailWireFrameProtocol?
    var post: PostModel?
    
    func viewDidLoad() {
        view?.showPostDetail(forPost: post!)
    }
    
}

