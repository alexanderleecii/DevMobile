//
//  PostModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation


class Post : Identifiable, ObservableObject, Decodable{
    var _id = ""
    var tags : [String] = []
    var title : String
    var text : String
    var pseudo : String
    var user : String = ""
    var likes : [Like] = []
    @Published var nbLikes : Int = 0
    var reports : [Report] = []
    var nbReports : Int = 0
    var comments : [Comment] = []
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
        
        //self.location = try values.decode(String.self, forKey: .location)
        //self.imgUrl = try values.decode(String.self, forKey: .imgUrl)
    }
    
    init(title:String, text:String, pseudo: String, location:String, imgUrl:String, tags:[String]){
        self.title = title
        self.text = text
        self.pseudo = pseudo
        self.location = location
        self.imgUrl = imgUrl
        self.tags = tags
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
    
    init(text:String, nbLikes:Int, nbReports:Int, date:Date) {
        self.title = "null"
        self.text = text
        self.pseudo = "null"
        self.nbLikes = nbLikes
        self.nbReports = nbReports
        self.date = date
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
