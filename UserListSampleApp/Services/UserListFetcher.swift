//
//  UserListFetcher.swift
//  UserListSampleApp
//
//  Created by Sarika Kelkar on 21/12/21.
//

import Foundation
import UIKit
struct User: Codable{
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String
    let address: Address
    let company: Company
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}

enum UserListError: Error {
    case urlIncorrect
    case error
}


class UserListFetcher: UserListAPIStrategy {
    static let shared = UserListFetcher()
    var userList: [User] = []
    
    private init() { }
    
    func fetchUserList(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        else { return }
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
                
            }catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
