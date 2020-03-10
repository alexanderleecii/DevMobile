//
//  SignIn.swift
//  MOP
//
//  Created by user165103 on 3/2/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//


//TODO password and mail verification

import Foundation
import SwiftUI




struct SignIn: View {
    @Environment(\.presentationMode) var presentation
    @State private var user : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var passwordRep : String = ""
    @State private var avatarImage : Image?
    // Avatar selecting control variables
    @State private var selectingImage = false
    @State private var imageAlreadySelected = false
    
    
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
                
            }.padding([.leading, .trailing,.bottom], 27.5)
            
            
            if !self.imageAlreadySelected {
                Button(action:{
                        self.selectingImage.toggle()
                    }){
                        if !imageAlreadySelected {
                            Text("Select Avatar")
                        }
                        else {
                            Text("Replace selected image")
                        }
                    }
                    .sheet(isPresented: self.$selectingImage, onDismiss: {
                        self.imageAlreadySelected.toggle()
                    }){
                        ImagePicker(isShown: self.$selectingImage, image: self.$avatarImage)
                    }
                
            }
            else {
                if avatarImage != nil{
                    avatarImage!
                    .resizable()
                    .frame(width: 300, height: 170)
                    .cornerRadius(10)
                }
            }
            
            
            Spacer()
            
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
            }
            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)

    }
}


struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
