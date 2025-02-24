//
//  MenuView.swift
//  MOP
//
//  Created by etud on 04/03/2020.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var mainViewRouter : MainViewRouter
    @ObservedObject var postViewRouter : PostViewRouter
    
    var body: some View {
        VStack(alignment: .leading){
            MenuButton(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter, name: "Latest posts")
            .padding(.top, 100)
            .font(.headline)
            MenuButton(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter, name: "Top posts")
            .padding(.top, 30)
            .font(.headline)
            
            if self.mainViewRouter.connectedUser == nil{
                // logic for when a user is logged = Sign Out - not logged Log In or Sign In
                MenuButton(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter, name: "Log In")
                .padding(.top, 30)
                .font(.headline)
                MenuButton(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter, name: "Sign Up")
                .padding(.top, 30)
                .font(.headline)
            }else{
                MenuButton(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter, name: "Profile")
                .padding(.top, 30)
                .font(.headline)
                MenuButton(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter, name: "Log Out")
                .padding(.top, 30)
                .font(.headline)
            }
            MenuButton(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter, name: "Settings")
            .padding(.top, 50)
            Spacer()
        }
        .padding(.leading, 30)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
        
    }
}


struct MenuButton : View {
    @ObservedObject var mainViewRouter : MainViewRouter
    @ObservedObject var postViewRouter : PostViewRouter
    var name : String
    var body : some View{
        HStack{
            Button(action: {
                if self.name == "Log Out"{
                    if self.mainViewRouter.currentPage == "profile"{
                        self.mainViewRouter.currentPage = "latest_posts"
                    }
                    self.mainViewRouter.connectedUser = nil
                    self.mainViewRouter.token = nil
                    withAnimation{
                        self.mainViewRouter.showMenu = false
                        self.postViewRouter.showPost = false
                        self.mainViewRouter.showUser = false
                        self.mainViewRouter.userProfile = nil
                    }
                }else{
                    self.mainViewRouter.currentPage = String(self.name.lowercased().replacingOccurrences(of: " ", with: "_"))
                    withAnimation{
                        self.mainViewRouter.showMenu = false
                        self.postViewRouter.showPost = false
                        self.mainViewRouter.showUser = false
                        self.mainViewRouter.userProfile = nil
                    }
                }
            }){
                Text(name)
                .foregroundColor(Color.gray)
            }
        }
    }
}
 

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(mainViewRouter: MainViewRouter(), postViewRouter: PostViewRouter())
    }
}
