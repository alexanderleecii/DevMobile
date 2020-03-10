//
//  LikeModel.swift
//  MOP
//
//  Created by etud on 10/03/2020.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class Like: Decodable{
    var _id = ""
    var user = ""
    
    enum CodingKeys: String, CodingKey{
        case _id
        case user
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try values.decode(String.self, forKey: ._id)
        self.user = try values.decode(String.self, forKey: .user)
    }
}
