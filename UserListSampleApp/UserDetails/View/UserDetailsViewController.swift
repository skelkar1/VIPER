//
//  UserDetailsViewController.swift
//  UserListSampleApp
//
//  Created by Sarika Kelkar on 28/12/21.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    private var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var user: User! {
        didSet{
            userNameLabel.text = user.name
            emailLabel.text = user.email
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = user.name
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(userNameLabel)
        self.view.addSubview(emailLabel)
        self.view.addSubview(addressLabel)
        self.view.addSubview(companyLabel)
        
        NSLayoutConstraint.activate([userNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                                     userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     userNameLabel.heightAnchor.constraint(equalToConstant: 40)])
        NSLayoutConstraint.activate([emailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor),
                                     emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     emailLabel.heightAnchor.constraint(equalToConstant: 40)])
        NSLayoutConstraint.activate([addressLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
                                     addressLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     addressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     addressLabel.heightAnchor.constraint(equalToConstant: 70)])
        NSLayoutConstraint.activate([companyLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor),
                                     companyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     companyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     companyLabel.heightAnchor.constraint(equalToConstant: 70)])
        
        userNameLabel.textAlignment = .center
        emailLabel.textAlignment = .center
        addressLabel.textAlignment = .center
        companyLabel.textAlignment = .center
        
        userNameLabel.font = UIFont(name: "Helvetica", size: 12)
        emailLabel.font = UIFont(name: "Helvetica", size: 12)
        addressLabel.font = UIFont(name: "Helvetica", size: 12)
        companyLabel.font = UIFont(name: "Helvetica", size: 12)
        
        addressLabel.numberOfLines = 0
        companyLabel.numberOfLines = 0
        
        userNameLabel.text = "User Name: " + user.username
        emailLabel.text = "Email: " + user.email
        addressLabel.text = "Address: \n" + user.address.street + " \n" + user.address.suite + " \n" + user.address.city + " \n" + user.address.zipcode
        companyLabel.text = "Company: \n" + user.company.name + " \n" + user.company.catchPhrase + " \n" + user.company.bs
        
    }

}
