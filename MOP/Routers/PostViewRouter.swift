//
//  PostViewRouter.swift
//  MOP
//
//  Created by user165103 on 3/4/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class PostViewRouter: ObservableObject{
    //Passes its data to any view that's observing whenever the objectWillChange property is called
    let objectWillChange = PassthroughSubject<PostViewRouter,Never>()
    
    var showPost: Bool = false{
        didSet{
            objectWillChange.send(self)
        }
    }
    
    var post: Post = Post(){
        didSet{
            objectWillChange.send(self)
        }
    }
}
