//
//  PostDetailProtocols.swift
//  iOS-Viper-Architecture
//
//  Created by Amir Samir on 23/06/21.
//  
//

import UIKit

protocol PostDetailViewProtocol: class {
    var presenter: PostDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showPostDetail(forPost post: PostModel)
}

protocol PostDetailWireFrameProtocol: class {
    static func createPostDetailModule(forPost post: PostModel) -> UIViewController
}

protocol PostDetailPresenterProtocol: class {
    var view: PostDetailViewProtocol? { get set }
    var wireFrame: PostDetailWireFrameProtocol? { get set }
    var post: PostModel? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
