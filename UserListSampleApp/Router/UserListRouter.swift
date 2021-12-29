//
//  UserListRouter.swift
//  UserListSampleApp
//
//  Created by Sarika Kelkar on 24/12/21.
//

import Foundation
import UIKit

class UserListRouter: UserListRouterInterface {
    func showUserDetails(_ navigationController: UINavigationController?, for user: User) {
        let userDetailsVC = UserDetailsViewController()
        userDetailsVC.user = user
        navigationController?.pushViewController(userDetailsVC, animated: true)
    }
}
