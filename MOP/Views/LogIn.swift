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
    @ObservedObject var mainViewRouter: MainViewRouter
    @ObservedObject var userVM : UserViewModel
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject private var keyboard = KeyboardObserver()
    
    @State private var email : String = ""
    @State private var password : String = ""
    
    @State private var showErrorMessage = false
    @State private var errorMsg = ""
    var body : some View {
        VStack{
            
            Text("Welcome back !")
            .font(.largeTitle)
            .foregroundColor(Color(red: 0.8, green: 0.3, blue: 0.3))
            .padding(.bottom, keyboard.currentHeight == 0 ? 100 : 10)
            .padding(.top, keyboard.currentHeight == 0 ? 150 : 30)
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Email", text: self.$email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20.0)
                
                SecureField("Password", text: self.$password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20.0)
            }
            .padding([.leading, .trailing], 27.5)
            
            HStack(spacing: 0) {
                Text("Don't have an account? ")
                Button(action: {
                    self.mainViewRouter.currentPage = "sign_up"
                }) {
                    Text("Sign Up")
                    .foregroundColor(Color(red: 0.8, green: 0.3, blue: 0.3))
                }
            }
            
            if self.showErrorMessage{
                Text(errorMsg)
                    .foregroundColor(.red)
                    .padding([.top, .bottom], 5)
            }
            
            Button(action: {
                if self.email == ""{
                    self.showErrorMessage = true
                    self.errorMsg = "You must enter an email"
                }else if self.password == ""{
                    self.showErrorMessage = true
                    self.errorMsg = "You must enter a password"
                }else{
                    self.userVM.login(email: self.email, password: self.password){user, token, error in
                        if let user = user{
                            self.mainViewRouter.connectedUser = user
                            self.mainViewRouter.token = token
                            self.mainViewRouter.currentPage = "latest_posts"
                        }else if let error = error{
                            self.showErrorMessage = true
                            self.errorMsg = error
                        }
                    }
                }
            }){
                Text("Log In")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 150, height:50)
                .background(Color(red: 0.8, green: 0.3, blue: 0.3))
                .cornerRadius(15.0)
                .padding(.top)
            }
            Spacer()
        }
        .padding(.bottom, keyboard.currentHeight)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct logIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn(mainViewRouter: MainViewRouter(), userVM: UserViewModel())
    }
}
	
