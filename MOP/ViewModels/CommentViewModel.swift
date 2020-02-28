//
//  CommentViewModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class CommentViewModel : ObservableObject{
    @Published var commentSet : [Comment]
    
    init(){
        commentSet = []
    }
}
