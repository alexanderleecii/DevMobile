//
//  QueryHandler.swift
//  MOP
//
//  Created by user165103 on 3/2/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation
import MongoKitten

class QueryHandler{
    var db : MongoDatabase
    init() {
        db = try! MongoDatabase.synchronousConnect("mongodb+srv://bduser:password07@mernswiftproject-1jeom.mongodb.net/test?retryWrites=true&w=majority")
    }
    
    func fetchUser(_id : String) -> [String]{
        var res : [String] = []
        let users = db["users"]
        
        let pseudo = users.find("_id" == _id).map{document in
            res.append((document["pseudo"] as? String)!)
        }
        return res
    }
}
