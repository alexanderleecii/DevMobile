//
//  PostModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation


class Post : Identifiable, ObservableObject, Codable{
    var _id = ""
    var tags : [String] = []
    var title : String
    var text : String
    var pseudo : String
    var user : String = ""
    var likes : [Like] = []
    @Published var nbLikes : Int = 0
    @Published var reports : [Report] = []
    var nbReports : Int = 0
    @Published var comments : [Comment] = []
    var location : String? = nil
    var imgUrl : String? = nil
    var date = Date()
    
    enum CodingKeys: String, CodingKey{
        case _id
        case tags
        case title
        case text
        case pseudo
        case user
        case likes
        case nbLikes
        case reports
        case nbReports
        case comments
        case imgUrl
        case location
        case date
    }
    
    
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try values.decode(String.self, forKey: ._id)
        
        self.tags = try values.decode([String].self, forKey: .tags)
        
        self.title = try values.decode(String.self, forKey: .title)
        
        self.text = try values.decode(String.self, forKey: .text)
        
        self.pseudo = try values.decode(String.self, forKey: .pseudo)
        
        self.user = try values.decode(String.self, forKey: .user)
        
        self.likes = try values.decode([Like].self, forKey: .likes)
        
        self.nbLikes = self.likes.count
        
        self.reports = try values.decode([Report].self, forKey: .reports)
        
        self.nbReports = self.reports.count

        self.comments = try values.decode([Comment].self, forKey: .comments)
        
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
        self.date = format.date(from: try values.decode(String.self, forKey: .date))!
        
        self.location = try values.decodeIfPresent(String.self, forKey: .location)
        //self.imgUrl = try values.decode(String.self, forKey: .imgUrl)
    }
    
    init(tags:[String], title: String, text:String, pseudo: String, user: String, location:String, imgUrl:String){
        self.tags = tags
        self.title = title
        self.text = text
        self.pseudo = pseudo
        self.user = user
        if location != ""{
            self.location = location
        }
        if imgUrl != ""{
            self.imgUrl = imgUrl
        }
    }
    
    init()
    {
        self.title = "null"
        self.text = ""
        self.pseudo = "null"
        self.nbLikes = 0
        self.nbReports = 0
        self.tags = []
        self.comments = []
    }
    
    func encode(to encoder: Encoder) throws{
        var values = encoder.container(keyedBy: CodingKeys.self)
        
        if !tags.isEmpty{
            let tagString = self.tags.joined(separator: ",") //Server wants to work with a string
            try values.encode(tagString, forKey: .tags)
        }
        try values.encode(self.title, forKey: .title)
        try values.encode(self.text, forKey: .text)
        try values.encodeIfPresent(self.location, forKey: .location)
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
    
    func orderCommentsBy(viewType att : String){
        if att == "latest" {
            self.comments.sort(by: {$0.date > $1.date})
        }
        else if att == "top"{
           self.comments.sort(by: {$0.nbLikes > $1.nbLikes})
        }
    }
    
    func addComment(comment: Comment, token: String){
        self.comments.append(comment)
        PostViewModel().addComment(postid: self._id, comment: comment, token: token)
    }
}
