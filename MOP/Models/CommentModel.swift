//
//  CommentModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class Comment:Identifiable, ObservableObject, Decodable{
    var _id : String
    @Published var nbLikes : Int
    var text : String
    var nbReports : Int
    var pseudo : String
    
    enum CodingKeys: String, CodingKey{
        case _id
        case nbLikes
        case text
        case nbReports
        case pseudo
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
        self.nbLikes = try values.decode(Int.self, forKey: .nbLikes)
        self._id = try values.decode(String.self, forKey: ._id)
        self.text = try values.decode(String.self, forKey: .text)
        self.nbReports = try values.decode(Int.self, forKey: .nbReports)
        self.pseudo = try values.decode(String.self, forKey: .pseudo)
    }
}
