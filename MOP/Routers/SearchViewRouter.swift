//
//  SearchViewRouter.swift
//  MOP
//
//  Created by user165103 on 3/16/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class SearchViewRouter: ObservableObject{
    //Passes its data to any view that's observing whenever the objectWillChange property is called
    let objectWillChange = PassthroughSubject<SearchViewRouter,Never>()
    
    var searchType: String = "people"{
        didSet{
            printState()
            objectWillChange.send(self)
        }
    }
    
    var searchString: String = ""{
        didSet{
            printState()
            objectWillChange.send(self)
        }
    }
    
    var somethingChanged = false{
        didSet{
            printState()
            objectWillChange.send(self)
        }
    }
    
    func printState(){
        print(["SearchViewRouter state",searchType,searchString])
    }
    
}
