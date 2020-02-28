//
//  AbstractGeneralPost.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

protocol GeneralPost{
    var id : Int {get set}
    var nbLikes : Int {get set}
    var text : String {get set}
    var nbReports : Int {get set}
}
