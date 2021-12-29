//
//  UserListPresenter.swift
//  UserListSampleApp
//
//  Created by Sarika Kelkar on 21/12/21.
//

import Foundation

class UserListPresenter {
    weak var viewController:  UserListViewController?
    private let router: UserListRouter
    
    init(router: UserListRouter){
        self.router = router
    }
}

extension UserListPresenter: UserListPresenterInterface {
    func showUserDetails(for user: User) {
        router.showUserDetails(viewController?.navigationController, for: user)
    }
    
    func sendHeaderTitle(title: String) {
        viewController?.setHeaderTitle(title: "User List")
    }
    
    func showUserList(withUsers list: [User]) {
        viewController?.showUserList(with: list)
    }
    
    func showSpinner() {
        viewController?.showSpinner()
    }
    
    func hideSpinner() {
        viewController?.hideSpinner()
    }
    
    func continueToDetailScreen(with user: User) {
        
    }
    
    func presentErrorScreen(error: Error) {
        
    }
    
    
}
