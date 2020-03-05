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
        VStack{
            
            Text("Log In")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding(.bottom, 100)
                .padding(.top, 150)
                .shadow(radius: 10.0, x: 20, y: 10)
            
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
                TextField("User", text: self.$user)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                SecureField("Password", text: self.$password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {
                self.presentation.wrappedValue.dismiss()
            }){
                Text("Log In")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 150, height:50)
                .background(Color.blue)
                .cornerRadius(15.0)
                .shadow(radius: 10, x:20, y:10)
                .padding(.top)
            }
            
            Spacer()
            HStack(spacing: 0) {
                Text("Don't have an account? ")
                Button(action: {
                    SignIn()
                }) {
                    Text("Sign Up")
                    .foregroundColor(.blue)
                }
            }
            .padding(.bottom, 15.0)
        }
        .background(LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}

struct logIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
	
