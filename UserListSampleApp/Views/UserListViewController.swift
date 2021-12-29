//
//  UserListViewController.swift
//  UserListSampleApp
//
//  Created by Sarika Kelkar on 21/12/21.
//

import UIKit

class UserListViewController: UIViewController {
    var userListInteractor: UserListInteractorInterface?
    
    private var allUsers:[User] = []
    
    // Spinner loader
    private var spinnerContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var tableView: UITableView =  {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        userListInteractor?.setupForUserList()
    }
}

extension UserListViewController: UserListViewControllerInterface {
    func showSpinner() {
        setupSpinnerView()
    }
    
    func hideSpinner() {
        DispatchQueue.main.async {
            self.spinnerContainerView.removeFromSuperview()
        }
    }
    
    private func setupSpinnerView() {
        self.view.addSubview(spinnerContainerView)
        NSLayoutConstraint.activate([spinnerContainerView.topAnchor.constraint(equalTo: view.topAnchor),
                                     spinnerContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     spinnerContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     spinnerContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     spinnerContainerView.heightAnchor.constraint(equalTo: view.heightAnchor)])
        
        let loadingSpinner: UIActivityIndicatorView = {
            let loadingSpinner = UIActivityIndicatorView(style: .large)
            loadingSpinner.translatesAutoresizingMaskIntoConstraints = false
            loadingSpinner.hidesWhenStopped = true
            return loadingSpinner
        }()
        spinnerContainerView.addSubview(loadingSpinner)
        loadingSpinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loadingSpinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        loadingSpinner.startAnimating()
    }
    
    func setupScreen() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
        
        tableView.register(CustomTableViewCell.self as AnyClass, forCellReuseIdentifier: "cell")
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.topAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     tableView.heightAnchor.constraint(equalTo: view.heightAnchor)])
        
        userListInteractor?.getHeaderTitle()
    }
    
    func showUserList(with users: [User]) {
        if users.count > 0 {
            DispatchQueue.main.async {
                self.allUsers = users
                self.tableView.reloadData()
            }
            
        }
    }
    
    func setHeaderTitle(title: String) {
        navigationItem.title = title
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
        if cell == nil {
            cell = CustomTableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.setupCell(with: allUsers[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell, let user = cell.user {
            userListInteractor?.showUserDetails(for: user)
        }
        
    }
    
}

