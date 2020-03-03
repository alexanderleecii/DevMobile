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

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Required Personal Information")){
                    TextField("User Name", text: $user)
                    TextField("Email", text: $email)
                }
                Section(header: Text("Password")){
                    SecureField("Password", text: $email)
                    SecureField("Repeat your password", text: $email)
                }
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }){
                    Text("Sign In")
                }
            } .navigationBarTitle("Sing In")
        }
    }
}


struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
