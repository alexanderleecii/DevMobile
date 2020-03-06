//
//  PostDAO.swift
//  MOP
//
//  Created by user165103 on 3/2/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class PostDAO{
    let qh = QueryHandler(endpoint: "posts/")
    
    func loadPostWithId(_id: String){
        guard let json = qh.getWithId(_id: _id) else { return }
        let decoder = JSONDecoder()
        //let post = try? decoder.decode(Post.self, from: json)
    }
    
    func loadAllPosts(){
        qh.getAll()
    }
}
