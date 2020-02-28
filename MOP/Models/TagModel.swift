//
//  TagModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class Tag{
    var posts : [Post]?
    var label : String
    
    init(label:String) {
        self.label = label
    }
}
