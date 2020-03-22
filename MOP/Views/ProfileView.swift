//
//  ProfileView.swift
//  MOP
//
//  Created by user165103 on 3/18/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct ProfileView: View{
    @ObservedObject var user : User
    
    @ObservedObject var mainViewRouter: MainViewRouter
    @ObservedObject var postViewRouter: PostViewRouter
    @ObservedObject var searchVR: SearchViewRouter
    @ObservedObject var posts: PostViewModel
    @State var updateUsername = false
    @State private var username: String = ""
    
    var body: some View{
        /*let user = self.mainViewRouter.connectedUser
         if user != nil{
         self.username = user!.pseudo
         }*/
        VStack(alignment: .center){
            Text("Profile")
                .font(.system(size: 50))
                .frame(width: 350, height: 50, alignment: .center)
                .padding(.bottom, 50)
            
            if self.user.avatar != ""{
                ImageView(imageURL: self.user.avatar)
                    .cornerRadius(360)
                    .frame(width: 100, height: 100)
            }else{
                Image("default-profile")
                    .cornerRadius(360)
            }
            
            if self.mainViewRouter.connectedUser != nil{
                if self.user.email == self.mainViewRouter.connectedUser!.email{
                    Text("My email")
                        .padding(.bottom, 10)
                        .font(.system(size: 30))
                    Text(self.user.email)
                        .font(.system(size: 20))
                        .padding(.bottom, 30)
                }
            }
            
            Text("My username")
                .padding(.bottom, 10)
                .font(.system(size: 30))
            HStack{
                if !updateUsername{
                    Text(self.user.pseudo)
                        .font(.system(size: 20))
                    if self.mainViewRouter.connectedUser != nil{
                        Button(action: {
                            self.updateUsername = true
                        }){
                            Text("Update")
                                .font(.headline)
                                .frame(width: 100, height: 30)
                                .background(Color.gray)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }
                    }
                }else{
                    TextField("Pseudo", text: self.$username)
                        .padding()
                        .background(Color.white)
                        .border(Color.gray)
                        .cornerRadius(20.0)
                    Button(action: {
                        self.updateUsername = false
                        self.mainViewRouter.connectedUser?.pseudo = self.username
                    }){
                        Text("Save")
                            .font(.headline)
                            .frame(width: 100, height: 30)
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    }
                }
            }.padding([.leading, .trailing], 27.5)
            Text("My posts")
                .padding(.bottom, 10)
                .font(.system(size: 30))
            
            ScrollView{
                VStack(spacing: 10){
                    ForEach(self.posts.getUserPosts(_id: self.user._id)){post in
                        PostItem(post: post, postViewRouter: self.postViewRouter, mainViewRouter: self.mainViewRouter, searchVR: self.searchVR)
                        Spacer()
                    }
                }
            }
            
            Spacer()
        }
        
    }
}
