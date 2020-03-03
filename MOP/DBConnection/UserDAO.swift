//
//  UserDAO.swift
//  MOP
//
//  Created by etud on 03/03/2020.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class UserDAO{
    let qh = QueryHandler(endpoint: "users/")
    
    func load(_id: String) -> User{
        qh.load(_id: _id){[weak self] result in
            switch result{
                case .failure(let error):
                    print(error)
                case .success(let user):
                    return user
            }
        }
    }
}
