//
//  SignIn.swift
//  MOP
//
//  Created by user165103 on 3/2/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation
import SwiftUI

/*

 var pseudo : String
 var email : String
 var password : String
 */
 



struct SignIn: View {
    @Environment(\.presentationMode) var presentation
    @State private var user : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var passwordRep : String = ""
    var body: some View {
        VStack{
            Text("Sign In")
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding(.bottom, 100)
            .padding(.top, 150)
            .shadow(radius: 10.0, x: 20, y: 10)

            VStack(alignment: .leading, spacing: 20) {
                TextField("User", text: self.$user)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                TextField("Mail", text: self.$email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                SecureField("Password", text: self.$password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                SecureField("Repeat your password", text: self.$passwordRep)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                TextField("Select Avatar", text: self.$email)
                .padding()
                .background(Color.white)
                .cornerRadius(20.0)
                .shadow(radius: 10.0, x: 20, y: 10)
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {
                self.presentation.wrappedValue.dismiss()
            }){
                Text("Sign In")
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
        }
        .background(LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)

    }
}


struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
