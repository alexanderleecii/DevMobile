//
//  PostViewModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation
import MongoKitten

class PostViewModel : ObservableObject{
    @Published var postSet : [Post]
    
    init(){
        let p1 = Post(_id: "154e6fc", nbLikes: 1, text: "C'est pas cool", nbReports: 0)
        let p2 = Post(_id: "699th58", nbLikes: 1, text: "Mashallah ma chérie wesh", nbReports: 0)
        postSet = []
        postSet.append(p1)
        postSet.append(p2)
        postSet[0].addTag(tag: "#Test")
        postSet[0].addTag(tag: "#Test2")
        postSet[0].addLocation(loc:"Montpellier, France")
        postSet[1].addTag(tag: "#Ribonucleico")
        postSet[1].addLocation(loc:"Egipt, Rio du Janeiro")
        
        /*let dao = UserDAO()
        dao.loadUserWithId(_id: "5e5c4351e51c162720ca985")*/
    }
}
