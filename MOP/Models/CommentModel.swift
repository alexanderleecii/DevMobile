//
//  CommentModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class Comment:Identifiable, ObservableObject, Decodable{
    var _id = ""
    var text : String
    var pseudo : String
    var user : String = ""
    var date = Date()
    var likes : [Like] = []
    @Published var nbLikes : Int = 0
    @Published var reports : [Report] = []
    var nbReports : Int = 0
    
    enum CodingKeys: String, CodingKey{
        case _id
        case text
        case pseudo
        case user
        case date
        case likes
        case nbLikes
        case reports
        case nbReports
    }
    
    init(_id:String, nbLikes:Int, text:String, nbReports: Int, pseudo: String){
        self._id = _id
        self.nbLikes = nbLikes
        self.text = text
        self.nbReports = nbReports
        self.pseudo = pseudo
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try values.decode(String.self, forKey: ._id)
        
        self.text = try values.decode(String.self, forKey: .text)
        
        self.pseudo = try values.decode(String.self, forKey: .pseudo)
        
        self.user = try values.decode(String.self, forKey: .user)
        
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
        self.date = format.date(from: try values.decode(String.self, forKey: .date))!
        
        self.likes = try values.decode([Like].self, forKey: .likes)
        
        self.nbLikes = self.likes.count
        
        self.reports = try values.decode([Report].self, forKey: .reports)
        
        self.nbReports = self.reports.count
    }
}
