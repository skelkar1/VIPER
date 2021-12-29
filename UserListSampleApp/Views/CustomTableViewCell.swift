//
//  CustomTableViewCell.swift
//  UserListSampleApp
//
//  Created by Sarika Kelkar on 27/12/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private var nameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    var user: User?
    
    private var emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        return emailLabel
    }()
    
    private func configureCell(){
        contentView.addSubview(nameLabel)
        contentView.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                                     nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                                     nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5),
                                     nameLabel.heightAnchor.constraint(equalToConstant: 30)])
        NSLayoutConstraint.activate([emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
                                     emailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
                                     emailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5),
                                     emailLabel.heightAnchor.constraint(equalToConstant: 20)])
        
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 15)
        emailLabel.font = UIFont(name: "Helvetica", size: 12)
    }
    
    
    func setupCell(with user: User) {
        configureCell()
        self.user = user
        nameLabel.text = user.name
        emailLabel.text = user.email
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
