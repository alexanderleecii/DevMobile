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
import Firebase

struct SignUpView: View {
    @Environment(\.presentationMode) var presentation
    @ObservedObject var mainViewRouter: MainViewRouter
    @ObservedObject var userVM : UserViewModel
    @State private var user : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var passwordRep : String = ""
    @State var avatarImageURL : String = ""
    
    @ObservedObject private var keyboard = KeyboardObserver()
    
    @State private var currentField = 0
    
    // Avatar selecting control variables
    @State private var selectingImage = false
    @State private var imageAlreadySelected = false
    
    //Errors
    @State private var showErrorMessage = false
    @State private var errorMsg = ""
    
    var body: some View {
        VStack{
            Text("Join us !")
            .font(.largeTitle)
            .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.8, opacity: 1))
            .padding(.bottom, keyboard.currentHeight == 0 ? 100 : 10)
            .padding(.top, keyboard.currentHeight == 0 ? 150 : 30)
            
            if self.currentField == 0{
                TextField("Username", text: self.$user)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20.0)
                .padding([.leading, .trailing], 27.5)
                    //.padding(.top, keyboard.currentHeight == 0 ? 0 : 100)
            }else if self.currentField == 1{
                TextField("Email", text: self.$email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20.0)
                .padding([.leading, .trailing], 27.5)
            }else if self.currentField == 2{
                SecureField("Password", text: self.$password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20.0)
                .padding([.leading, .trailing], 27.5)
            }else if self.currentField == 3{
                SecureField("Confirm password", text: self.$passwordRep)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20.0)
                .padding([.leading, .trailing], 27.5)
            }
            
            if self.showErrorMessage{
                Text(self.errorMsg)
                .foregroundColor(.red)
            }
            
            if avatarImageURL != ""{
                ImageView(imageURL: self.avatarImageURL)
                .cornerRadius(360)
                .frame(width: 100, height: 100)
            }
            
            Button(action:{
                self.selectingImage.toggle()
            }){
                if !imageAlreadySelected {
                    Text("Select Avatar")
                    .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.8, opacity: 1))
                }
                else {
                    Text("Replace selected image")
                    .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.8, opacity: 1))
                }
            }
            .padding(.bottom, 10)
            .sheet(isPresented: self.$selectingImage, onDismiss: {
                self.imageAlreadySelected.toggle()
            }){
                ImagePicker(isShown: self.$selectingImage, imageURL: self.$avatarImageURL, imageType: "avatar")
            }
            
            HStack{
                if self.currentField != 0{
                    Button(action: {
                        self.showErrorMessage = false
                        self.currentField -= 1
                    }){
                        Text("<")
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                        .padding(3)
                        .frame(width: 30, height: 30)
                            .background(Color.gray.opacity(0.2))
                        .foregroundColor(Color.white)
                        .cornerRadius(360)
                    }
                }
                if self.currentField != 3{
                        Button(action: {
                            switch self.currentField{
                                case 0:
                                    if self.user == ""{
                                        self.showErrorMessage = true
                                        self.errorMsg = "Please include a username"
                                    }else{
                                        self.showErrorMessage = false
                                        self.currentField += 1
                                    }
                                case 1:
                                    if self.email == ""{
                                        self.showErrorMessage = true
                                        self.errorMsg = "Please include an email"
                                    }else{
                                        self.showErrorMessage = false
                                        self.currentField += 1
                                    }
                                case 2:
                                    if self.password == ""{
                                        self.showErrorMessage = true
                                        self.errorMsg = "Please include a password"
                                    }else{
                                        self.showErrorMessage = false
                                        self.currentField += 1
                                    }
                                default:
                                    break
                                }
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
                        if self.passwordRep != self.password {
                            self.showErrorMessage = true
                            self.errorMsg = "The passwords are different"
                        }else{
                            self.userVM.register(pseudo: self.$user.wrappedValue, email: self.$email.wrappedValue, password: self.$password.wrappedValue, avatar: self.$avatarImageURL.wrappedValue){user, token, error in
                                if let token = token{
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
                        Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height:50)
                        .background(Color(red: 0.7, green: 0.7, blue: 0.8, opacity: 1))
                        .cornerRadius(15.0)
                    }
                }
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)

    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(mainViewRouter: MainViewRouter(), userVM: UserViewModel())
    }
}
