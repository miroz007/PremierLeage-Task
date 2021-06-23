//
//  PostListPresenter.swift
//  iOS-Viper-Architecture
//
//  Created by Amir Samir on 23/06/21.
//  
//

class PostListPresenter: PostListPresenterProtocol {
    weak var view: PostListViewProtocol?
    var interactor: PostListInteractorInputProtocol?
    var wireFrame: PostListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrievePostList()
    }
    
    func showPostDetail(forPost post: PostModel) {
        wireFrame?.presentPostDetailScreen(from: view!, forPost: post)
    }

}

extension PostListPresenter: PostListInteractorOutputProtocol {
    
    func didRetrievePosts(_ posts: [PostModel]) {
        view?.hideLoading()
        view?.showPosts(with: posts)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}


