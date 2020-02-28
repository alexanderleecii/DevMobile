//
//  TagViewModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class TagViewModel : ObservableObject{
    @Published var tagSet : [Tag]
    
    init() {
        tagSet = []
    }
}
