//
//  UserListConfigurator.swift
//  UserListSampleApp
//
//  Created by Sarika Kelkar on 22/12/21.
//

import UIKit

class UserListConfigurator: Configurator {
    func configViewController() -> UIViewController {
        let router:  UserListRouter = UserListRouter()
        let viewController = UserListViewController() // We can add custom initializer in UserListViewController to pass values from here.
        let presenter = UserListPresenter(router: router)
        let interactor = UserListInteractor(presenter: presenter)
        viewController.userListInteractor = interactor
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        
        return viewController
    }
}
