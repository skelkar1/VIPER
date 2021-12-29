//
//  UserListInterfaces.swift
//  UserListSampleApp
//
//  Created by Sarika Kelkar on 21/12/21.
//

import Foundation
import UIKit

protocol UserListViewControllerInterface: AnyObject {
    func setHeaderTitle(title: String)
    func setupScreen()
    func showUserList(with users: [User])
    func showSpinner()
    func hideSpinner()
}

protocol UserListInteractorInterface {
    func getHeaderTitle()
    func setupForUserList()
    func showUserDetails(for user:User)
}

protocol UserListPresenterInterface {
    func sendHeaderTitle(title: String)
    func showUserList(withUsers list: [User])
    func showUserDetails(for user:User)
    func showSpinner()
    func hideSpinner()
    func continueToDetailScreen(with user: User)
    func presentErrorScreen(error: Error)
}

protocol UserListRouterInterface {
    func showUserDetails(_ navigationController: UINavigationController?,for user: User)
}

protocol UserListAPIStrategy {
    func fetchUserList(completion: @escaping (Result<[User], Error>)-> Void)
}

protocol Configurator {
    func configViewController() -> UIViewController
}

protocol UINavigationControllerInterface: AnyObject {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]?
}
