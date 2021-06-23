//
//  PostListWireFrame.swift
//  iOS-Viper-Architecture
//
//  Created by Amir Samir on 23/06/21.
//  
//

import UIKit

class PostListWireFrame: PostListWireFrameProtocol {
    
    class func createPostListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "PostsNavigationController")
        if let view = navController.childViewControllers.first as? PostListView {
            let presenter: PostListPresenterProtocol & PostListInteractorOutputProtocol = PostListPresenter()
            let interactor: PostListInteractorInputProtocol & PostListRemoteDataManagerOutputProtocol = PostListInteractor()
            let remoteDataManager: PostListRemoteDataManagerInputProtocol = PostListRemoteDataManager()
            let wireFrame: PostListWireFrameProtocol = PostListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    

    func presentPostDetailScreen(from view: PostListViewProtocol, forPost post: PostModel) {
        let postDetailViewController = PostDetailWireFrame.createPostDetailModule(forPost: post)
   
        if let sourceView = view as? UIViewController {
           sourceView.navigationController?.pushViewController(postDetailViewController, animated: true)
        }
    }
    
}
