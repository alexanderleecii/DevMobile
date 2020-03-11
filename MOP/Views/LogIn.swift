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
    //@ObservedObject var user : User
    @ObservedObject var mainViewRouter: MainViewRouter
    @ObservedObject var userVM : UserViewModel
    @Environment(\.presentationMode) var presentation
    @State private var email : String = ""
    @State private var password : String = ""
    var body : some View {
        VStack{
            
            Text("Log In")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.bottom, 100)
                .padding(.top, 150)
            
            /*
            Image(systemName: "person")
                .resizable()
                .frame(width: 100, height: 100.0)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth:4))
                .shadow(radius: 10.0)
                .padding(.bottom, 50)
            */
            VStack(alignment: .leading, spacing: 15) {
                TextField("Email", text: self.$email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                
                SecureField("Password", text: self.$password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {
                self.userVM.login(email: self.email, password: self.password){user in
                    self.mainViewRouter.connectedUser = user
                }
                self.mainViewRouter.currentPage = "latest_posts"
            }){
                Text("Log In")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 150, height:50)
                .background(Color.gray)
                .cornerRadius(15.0)
                .padding(.top)
            }
            
            Spacer()
            HStack(spacing: 0) {
                Text("Don't have an account? ")
                Button(action: {
                    
                }) {
                    Text("Sign Up")
                    .foregroundColor(.blue)
                }
            }
            .padding(.bottom, 15.0)
        }
        .background(Color(red: 0.9, green: 0.7, blue: 0.7, opacity: 0.5) )
        .edgesIgnoringSafeArea(.all)
    }
}

struct logIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn(mainViewRouter: MainViewRouter(), userVM: UserViewModel())
    }
}
	
