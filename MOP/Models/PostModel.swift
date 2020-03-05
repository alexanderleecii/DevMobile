//
//  PostModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class Post : Identifiable, ObservableObject{
    var _id : String
    @Published var nbLikes : Int
    var text : String
    var nbReports : Int
    var imgUrl : String?
    var location : String?
    var tags : [String]
    
    init()
    {
        self._id = ""
        self.nbLikes = 0
        self.text = ""
        self.nbReports = 0
        self.tags = []
    }
    
    init(_id:String, nbLikes:Int, text:String, nbReports:Int) {
        self._id = _id
        self.nbLikes = nbLikes
        self.text = text
        self.nbReports = nbReports
        self.tags = []
    }
    
    func getTags() -> [String]{
        return self.tags
    }
    
    func addTag(tag:String){
        self.tags.append(tag)
    }
    
    func addLocation(loc:String){
        self.location = loc
    }
}
