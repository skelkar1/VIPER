//
//  UserListInteractor.swift
//  UserListSampleApp
//
//  Created by Sarika Kelkar on 21/12/21.
//

import Foundation


class UserListInteractor {
    var presenter: UserListPresenterInterface?
    
    private var allUsers: [User] = []
    
    init(presenter: UserListPresenterInterface) {
        self.presenter = presenter
    }
    
}

extension UserListInteractor: UserListInteractorInterface {
    func showUserDetails(for user: User) {
        presenter?.showUserDetails(for: user)
    }
    
    func getHeaderTitle() {
        let headerTitle = "User List"
        presenter?.sendHeaderTitle(title: headerTitle)
    }
    
    func setupForUserList() {
        presenter?.showSpinner()
        UserListFetcher.shared.fetchUserList { [weak self] result in
            guard let self = self else { return }
            self.presenter?.hideSpinner()
            self.handleResponseResults(with: result)
        }
    }
    
    private func handleResponseResults(with result:Result<[User], Error>) {
        switch result {
        case .success(let users):
            self.allUsers = users
            self.reload()
        case .failure(let error):
            self.handleResponseError(with: error)
            
        }
    }
    private func reload() {
        presenter?.showUserList(withUsers: allUsers)
    }
    
    private func handleResponseError(with error: Error){
        presenter?.presentErrorScreen(error: error)
    }
    
    
}
