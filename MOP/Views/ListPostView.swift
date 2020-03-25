//
//  PostsView.swift
//  MOP
//
//  Created by user165103 on 3/18/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct TopPostsView: View{
    @ObservedObject var posts : PostViewModel
    @ObservedObject var mainViewRouter: MainViewRouter
    @ObservedObject var postViewRouter: PostViewRouter
    @ObservedObject var searchVR : SearchViewRouter
    
    var body: some View{
        VStack{
            Text("Top posts")
            .font(.system(size: 30))
            .fontWeight(.semibold)
            .foregroundColor(Color.black.opacity(0.6))
            .frame(height: 50, alignment: .center)
            .padding(.top, 5)
            Spacer()
            if !posts.postSet.isEmpty{//So the ScrollView is only rendered after the data has been fetched
                ScrollView{
                    VStack(spacing: 10){
                        ForEach(self.posts.postSet){
                            post in
                            PostItem(post: post, postViewRouter: self.postViewRouter, mainViewRouter: self.mainViewRouter, searchVR: self.searchVR)
                            Spacer()
                        }
                    }
                    .padding(.top, 10)
                }
            }
            }
            .onAppear{
                self.posts.loadAllPosts()
            }
            .onReceive(self.posts.objectWillChange){posts in
               self.posts.getPostsOrderedBy(viewType: "top_posts")
            }
    }
}



struct LatestPostsView: View{
    @ObservedObject var posts : PostViewModel
    @ObservedObject var mainViewRouter: MainViewRouter
    @ObservedObject var postViewRouter: PostViewRouter
    @ObservedObject var searchVR : SearchViewRouter
    var body: some View{
        VStack{
            Text("Latest posts")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .foregroundColor(Color.black.opacity(0.6))
                .frame(height: 50, alignment: .center)
                .padding(.top, 5)
            Spacer()
            if !posts.postSet.isEmpty{ //So the ScrollView is only rendered after the data has been fetched
                ScrollView{
                    VStack(spacing: 10){
                        ForEach(self.posts.postSet){
                            post in
                            PostItem(post: post, postViewRouter: self.postViewRouter, mainViewRouter: self.mainViewRouter, searchVR: self.searchVR)
                            Spacer()
                        }
                    }
                    .padding(.top, 10)
                }
            }
        }
        .onAppear{
            self.posts.getPostsOrderedBy(viewType: "latest_posts")
        }
    }
}



struct UserPostsView: View{
    @ObservedObject var posts: PostViewModel
    @ObservedObject var postViewRouter: PostViewRouter
    @ObservedObject var mainViewRouter: MainViewRouter
    @ObservedObject var searchVR = SearchViewRouter()
    var body: some View{
        ScrollView{
            VStack(spacing: 10){
                ForEach(self.posts.postSet){post in
                    PostItem(post: post, postViewRouter: self.postViewRouter, mainViewRouter: self.mainViewRouter, searchVR:  self.searchVR)
                    Spacer()
                }
            }
            .padding(.top, 10)
        }
    }
}
