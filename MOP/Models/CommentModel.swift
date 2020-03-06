//
//  CommentModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class Comment:Identifiable, ObservableObject{
    var _id : String
    @Published var nbLikes : Int
    var text : String
    var nbReports : Int
    var pseudo : String
    
    init(_id:String, nbLikes:Int, text:String, nbReports: Int, pseudo: String){
        self._id = _id
        self.nbLikes = nbLikes
        self.text = text
        self.nbReports = nbReports
        self.pseudo = pseudo
    }
}
