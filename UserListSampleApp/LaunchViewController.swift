//
//  LaunchViewController.swift
//  UserListSampleApp
//
//  Created by Sarika Kelkar on 24/12/21.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        launchUserListJourney()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func launchJourneyButtonClick(_ sender: Any) {
        launchUserListJourney()
    }
    
    private func launchUserListJourney() {
        guard let navigator = navigationController else {
            assertionFailure("The view controller should be presenter in a UINavigationController")
            return
        }
//        let router = UserListRouter()
        let userListVC = UserListConfigurator().configViewController()
        navigator.pushViewController(userListVC, animated: false)
        
    }
    

}
