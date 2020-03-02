//
//  LogIn.swift
//  MOP
//
//  Created by user165103 on 3/2/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation
import SwiftUI

struct LogIn: View{
    @Environment(\.presentationMode) var presentation
    @State private var user : String = ""
    @State private var password : String = ""
    var body : some View {
        NavigationView{
            VStack{
                Form{
                    TextField("User", text: $user)
                    TextField("Password", text: $user)
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                        SignIn()
                    }){
                        Text("You are not already signed in?")
                    }
                }
                
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }){
                    Text("Log In")
                }
                
            }
            .navigationBarTitle(Text("Log In"))
        }
    }
}


	
