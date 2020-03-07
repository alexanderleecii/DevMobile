//
//  PostModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation


class Post : Identifiable, ObservableObject/*, Decodable*/{
    var _id = UUID()
    
    var text : String
    var imgUrl : String?
    var location : String?
    var tags : [String] = []
    
    @Published var nbLikes : Int = 0
    var nbReports : Int = 0
    
    
    var comments : [Comment] = []
    
    init(text:String, location:String, imgUrl:String, tags:[String]){
        self.text = text
        self.location = location
        self.imgUrl = imgUrl
        self.tags = tags
    }
    
    init()
    {
        self.nbLikes = 0
        self.text = ""
        self.nbReports = 0
        self.tags = []
        self.comments = []
    }
    
    init(text:String, nbLikes:Int, nbReports:Int) {
        self.text = text
        self.nbLikes = nbLikes
        self.nbReports = nbReports
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
