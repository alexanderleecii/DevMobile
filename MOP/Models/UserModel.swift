//
//  UserModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class User:Identifiable, ObservableObject, Decodable{
    var _id : String
    var pseudo : String
    var email : String
    //var password : String
    //var isAdmin : Bool
    
    init(id:String, pseudo:String, email:String, password:String, isAdmin:Bool){
        self._id = id
        self.pseudo = pseudo
        self.email = email
        //self.password = password
        //self.isAdmin = isAdmin
    }
}
