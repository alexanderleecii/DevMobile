//
//  UserViewRouter.swift
//  MOP
//
//  Created by user165103 on 3/22/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class UserViewRouter: ObservableObject{
    //Passes its data to any view that's observing whenever the objectWillChange property is called
    let objectWillChange = PassthroughSubject<UserViewRouter,Never>()
    
    var showUser: Bool = false{
        didSet{
            objectWillChange.send(self)
        }
    }
    
    var post: User? = nil{
        didSet{
            objectWillChange.send(self)
        }
    }
}
