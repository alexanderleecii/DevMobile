//
//  HomepageView.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct HomepageView: View {
    @ObservedObject var mainViewRouter = MainViewRouter()
    @ObservedObject var postViewRouter = PostViewRouter()
    @ObservedObject var searchVR = SearchViewRouter()
    
    @State var showingAddPostView = false
    @ObservedObject var posts = PostViewModel()
    @ObservedObject var userVM : UserViewModel
    
    @State private var showingAlertAddPost = false
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
                VStack(spacing: -4){
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
                    Spacer()
                    Divider()
                        .background(Color.gray)
                        .frame(width:420, height:1)
                    Spacer()
                    if !self.mainViewRouter.showMenu{
                        if !self.postViewRouter.showPost{
                            if self.mainViewRouter.currentPage == "latest_posts"{
                                /*GenericPostView(posts: self.posts, mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter)
                                .frame(width: geometry.size.width)*/
                                
                                LatestPostsView(posts: self.posts, mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter, searchVR: self.searchVR)
                                .frame(width: geometry.size.width)
                            }else if self.mainViewRouter.currentPage == "top_posts"{
                                TopPostsView(posts: self.posts, mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter, searchVR: self.searchVR)
                                .frame(width: geometry.size.width)
                            }else if self.mainViewRouter.currentPage == "profile"{
                                ProfileView(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter, searchVR: self.searchVR, posts: self.posts)
                            }else if self.mainViewRouter.currentPage == "settings"{
                                Text("settings")
                            }else if self.mainViewRouter.currentPage == "log_in"{
                                LogIn(mainViewRouter: self.mainViewRouter, userVM: self.userVM)
                            }else if self.mainViewRouter.currentPage == "sign_up"{
                                SignUpView(mainViewRouter: self.mainViewRouter, userVM: self.userVM)
                            }else if self.mainViewRouter.currentPage == "search"{
                                SearchView(mainVR: self.mainViewRouter, postVR: self.postViewRouter, searchVR: self.searchVR)
                            }
                        }else{
                            PostView(post: self.postViewRouter.post, mainViewRouter: self.mainViewRouter,postViewRouter: self.postViewRouter, searchVR: self.searchVR)
                        }
                    }else{
                        if !self.postViewRouter.showPost{
                            if self.mainViewRouter.currentPage == "latest_posts"{
                                LatestPostsView(posts: self.posts, mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter, searchVR: self.searchVR)
                                .frame(width: geometry.size.width)
                                .blur(radius: 2)
                                .disabled(self.mainViewRouter.showMenu)
                            }else if self.mainViewRouter.currentPage == "top_posts"{
                                TopPostsView(posts: self.posts, mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter, searchVR: self.searchVR)
                                .frame(width: geometry.size.width)
                                .blur(radius: 2)
                                .disabled(self.mainViewRouter.showMenu)
                            }else if self.mainViewRouter.currentPage == "profile"{
                                ProfileView(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter, searchVR: self.searchVR, posts: self.posts)
                                .frame(width: geometry.size.width)
                                .blur(radius: 2)
                                .disabled(self.mainViewRouter.showMenu)
                            }else if self.mainViewRouter.currentPage == "settings"{
                                Text("settings")
                            }else if self.mainViewRouter.currentPage == "log_in"{
                                LogIn(mainViewRouter: self.mainViewRouter, userVM: self.userVM)
                                .frame(width: geometry.size.width)
                                .blur(radius: 2)
                                .disabled(self.mainViewRouter.showMenu)
                            }else if self.mainViewRouter.currentPage == "sign_up"{
                                SignUpView(mainViewRouter: self.mainViewRouter, userVM: self.userVM)
                                .frame(width: geometry.size.width)
                                .blur(radius: 2)
                                .disabled(self.mainViewRouter.showMenu)
                            }else if self.mainViewRouter.currentPage == "search"{
                                SearchView(mainVR: self.mainViewRouter, postVR: self.postViewRouter, searchVR: self.searchVR)
                                .frame(width: geometry.size.width)
                                .blur(radius: 2)
                                .disabled(self.mainViewRouter.showMenu)
                            }
                        }else{
                            PostView(post: self.postViewRouter.post, mainViewRouter: self.mainViewRouter,postViewRouter: self.postViewRouter, searchVR: self.searchVR)
                            .frame(width: geometry.size.width)
                            .blur(radius: 2)
                            .disabled(self.mainViewRouter.showMenu)
                        }
                    }
                    HStack(spacing: 50){
                        Button(action:{
                            self.mainViewRouter.currentPage = "latest_posts"
                            self.postViewRouter.showPost = false
                        }){
                            Image("home")
                            .foregroundColor(Color.black)
                        }
                        if self.mainViewRouter.connectedUser != nil{
                            Button(action:{
                                self.showingAddPostView.toggle()
                                    
                            }){
                                Image("add")
                                .foregroundColor(Color.black)
                            }
                            .sheet(isPresented: self.$showingAddPostView){
                                AddPostView(mainViewRouter: self.mainViewRouter, posts: self.posts, visible: self.$showingAddPostView)
                            }
                        }else{
                            Button(action:{
                                self.showingAlertAddPost.toggle()
                            }){
                                Image("add")
                                .foregroundColor(Color.black)
                            }
                            .alert(isPresented: self.$showingAlertAddPost) {
                                Alert(title: Text(""), message: Text("You must be logged in."))
                            }
                        }
                        Button(action:{
                            self.mainViewRouter.currentPage = "search"
                        }){
                            Image("search")
                            .foregroundColor(Color.black)
                        }
                    }
                    .frame(width:420, height:60)
                    .background(Color.gray)
                }
                if self.mainViewRouter.showMenu{
                    MenuView(mainViewRouter: self.mainViewRouter, postViewRouter: self.postViewRouter)
                    .frame(width: geometry.size.width/2)
                        .padding(.leading)
                    .transition(.move(edge: .leading))
                }
            }
            .gesture(drag)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView(userVM: UserViewModel())
    }
}
