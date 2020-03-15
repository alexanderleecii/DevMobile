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




struct SignUpView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var mainViewRouter: MainViewRouter
    @ObservedObject var userVM : UserViewModel
    @State private var user : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var passwordRep : String = ""
    @State private var avatarImage : Image?
    
    @State private var currentField = 0
    
    // Avatar selecting control variables
    @State private var selectingImage = false
    @State private var imageAlreadySelected = false
    
    
    var body: some View {
        VStack{
            Text("Sign Up")
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding(.bottom, 100)
            .padding(.top, 150)
            
            if self.currentField == 0{
                TextField("Username", text: self.$user)
                .padding()
                .background(Color.white)
                .cornerRadius(20.0)
                .padding([.leading, .trailing], 27.5)
            }else if self.currentField == 1{
                TextField("Email", text: self.$email)
                .padding()
                .background(Color.white)
                .cornerRadius(20.0)
                .padding([.leading, .trailing], 27.5)
            }else if self.currentField == 2{
                SecureField("Password", text: self.$password)
                .padding()
                .background(Color.white)
                .cornerRadius(20.0)
                .padding([.leading, .trailing], 27.5)
            }else if self.currentField == 3{
                SecureField("Confirm password", text: self.$passwordRep)
                .padding()
                .background(Color.white)
                .cornerRadius(20.0)
                .padding([.leading, .trailing], 27.5)
            }
            
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
                    .padding(.bottom, 10)
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
            if self.currentField != 3{
                Button(action: {
                    self.currentField += 1
                }){
                    Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 150, height:50)
                    .background(Color.gray)
                    .cornerRadius(15.0)
                }
            }else{
                Button(action: {
                    self.userVM.register(pseudo: self.$user.wrappedValue, email: self.$email.wrappedValue, password: self.$password.wrappedValue){user, token in
                        //self.mainViewRouter.connectedUser = user
                        //self.mainViewRouter.token = token
                    }
                    self.mainViewRouter.currentPage = "latest_posts"
                }){
                    Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 150, height:50)
                    .background(Color.blue)
                    .cornerRadius(15.0)
                }
            }
            Spacer()
        }
        .background(Color(red: 0.7, green: 0.7, blue: 0.8, opacity: 1))
        .edgesIgnoringSafeArea(.all)

    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(mainViewRouter: MainViewRouter(), userVM: UserViewModel())
    }
}
