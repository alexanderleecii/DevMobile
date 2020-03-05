//
//  HomepageView.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct HomepageView: View {
    @ObservedObject var mainViewRouter : MainViewRouter
    @ObservedObject var postViewRouter : PostViewRouter
    
    var body: some View {
        
        //Custom swipe gesture to set showMenu to false when the user has swiped far enough
        let drag = DragGesture()
            .onEnded{
                if $0.translation.width < -100{
                    withAnimation{
                        self.mainViewRouter.showMenu = false
                    }
                }
            }
        
        //GeometryReader allows us to build the view according to the screen size
        return GeometryReader{ geometry in
            ZStack(alignment: .leading){
                if !self.mainViewRouter.showMenu{
                    
                    if self.mainViewRouter.currentPage == "latest_posts"{
                        LatestPostsView(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    }else if self.mainViewRouter.currentPage == "top_posts"{
                        TopPostsView(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    }else if self.mainViewRouter.currentPage == "profile"{
                        Text("profile")
                    }else if self.mainViewRouter.currentPage == "settings"{
                        Text("settings")
                    }
                    
                }else{
                    if self.mainViewRouter.currentPage == "latest_posts"{
                        LatestPostsView(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .blur(radius: 2)
                        .disabled(self.mainViewRouter.showMenu)
                    }else if self.mainViewRouter.currentPage == "top_posts"{
                        TopPostsView(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .blur(radius: 2)
                        .disabled(self.mainViewRouter.showMenu)
                    }else if self.mainViewRouter.currentPage == "profile"{
                        Text("profile")
                    }else if self.mainViewRouter.currentPage == "settings"{
                        Text("settings")
                    }
                    
                    MenuView(mainViewRouter: self.mainViewRouter)
                    .frame(width: geometry.size.width/2)
                    .transition(.move(edge: .leading))
                    
                }
            }
            .gesture(drag)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct LatestPostsView: View{
    @ObservedObject var posts = PostViewModel()
    @ObservedObject var mainViewRouter: MainViewRouter
    @ObservedObject var postViewRouter: PostViewRouter
    
    var body: some View{
        VStack{
            HStack{
                Button(action: {
                    withAnimation{
                        self.mainViewRouter.showMenu = true
                    }
                }){
                    Image("menu")
                        .foregroundColor(Color.gray)
                }
            }
            .padding(.top, 5)
            .frame(width: 350, height: 40, alignment: .leading)
            Divider()
                .background(Color.gray)
                .frame(width:420, height:10)
            Text("Latest posts")
                .font(.title).bold()
                .frame(width: 350, height: 50, alignment: .leading)
            ScrollView{
                VStack(spacing: 15){
                    ForEach(self.posts.postSet){
                        post in
                        PostItem(post: post, postViewRouter: self.postViewRouter)
                        Spacer()
                    }
                }
            }
            HStack(spacing: 50){
                Image("home")
                Image("add")
                Image("search")
            }
            .frame(width:420, height:60)
            .background(Color.gray)
        }
    }
}

struct TopPostsView: View{
    @ObservedObject var posts = PostViewModel()
    @ObservedObject var mainViewRouter: MainViewRouter
    @ObservedObject var postViewRouter: PostViewRouter
    
    var body: some View{
        VStack{
            HStack{
                Button(action: {
                    withAnimation{
                        self.mainViewRouter.showMenu = true
                    }
                }){
                    Image("menu")
                        .foregroundColor(Color.gray)
                }
            }
            .padding(.top, 5)
            .frame(width: 350, height: 40, alignment: .leading)
            Divider()
                .background(Color.gray)
                .frame(width:420, height:10)
            Text("Top posts")
                .font(.title).bold()
                .frame(width: 350, height: 50, alignment: .leading)
            ScrollView{
                VStack(spacing: 10){
                    ForEach(self.posts.postSet){
                        post in
                        PostItem(post: post, postViewRouter: self.postViewRouter)
                        Spacer()
                    }
                }
            }
            HStack(spacing: 50){
                Image("home")
                Image("add")
                Image("search")
            }
            .frame(width:420, height:60)
            .background(Color.gray)
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView(mainViewRouter: MainViewRouter(),postViewRouter: PostViewRouter())
    }
}
