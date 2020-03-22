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
    var avatar : String = ""
    //var isAdmin : Bool
    
    enum CodingKeys: String, CodingKey{
        case _id
        case pseudo
        case email
        case avatar
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try values.decode(String.self, forKey: ._id)
        
        self.pseudo = try values.decode(String.self, forKey: .pseudo)
        
        self.email = try values.decode(String.self, forKey: .email)
        
        self.avatar = try values.decodeIfPresent(String.self, forKey: .avatar) ?? ""
    }
    
    init(id:String, pseudo:String, email:String, password:String, isAdmin:Bool){
        self._id = id
        self.pseudo = pseudo
        self.email = email
        //self.password = password
        //self.isAdmin = isAdmin
    }
}
