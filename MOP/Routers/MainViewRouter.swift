//
//  MainViewRouter.swift
//  MOP
//
//  Created by etud on 04/03/2020.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

//Will notify and update all the observing views
class MainViewRouter: ObservableObject{
    
    //Passes its data to any view that's observing whenever the objectWillChange property is called
    let objectWillChange = PassthroughSubject<MainViewRouter,Never>()
    
    var showMenu: Bool = false{
        didSet{
            objectWillChange.send(self)
        }
    }
    
    var currentPage: String = "latest_posts"{
        didSet{
            objectWillChange.send(self)
        }
    }
    
    var connectedUser: User? = nil{
        didSet{
            objectWillChange.send(self)
        }
    }
    
    var token: String? = nil{
        didSet{
            objectWillChange.send(self)
        }
    }
    
    var sortedComments: String = "latest"{
        didSet{
            objectWillChange.send(self)
        }
    }
    
    func printState(){
        print(["MainViewRouter state:   showMenu=",showMenu,currentPage,connectedUser==nil ? "no user" : "user"])
    }
}
