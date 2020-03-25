//
//  PostItem.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct PostItem: View {
    @ObservedObject var post : Post
    @ObservedObject var postViewRouter : PostViewRouter
    @ObservedObject var mainViewRouter : MainViewRouter
    @ObservedObject var searchVR : SearchViewRouter
    @State private var showingAlert = false

    var body: some View {
        VStack(spacing:0){
            Button(action: {
                self.mainViewRouter.showUser = false
                self.mainViewRouter.userProfile = nil
                self.postViewRouter.post = self.post
                self.postViewRouter.showPost = true
            }){
                VStack{
                    Text(self.post.title)
                    .font(.system(size: 20))
                        .foregroundColor(Color.black.opacity(0.6))
                    .fontWeight(.bold)
                    Text(self.post.text)
                    .padding(.top, 15)
                        .foregroundColor(Color.gray.opacity(0.95))
                        .frame(width: 350, alignment: .center)
                    if self.post.imagePost != nil && self.post.imagePost != ""{
                        ImageView(imageURL: self.post.imagePost!)
                            .frame(width: 200, height: 150)
                    }
                }
            }
            .buttonStyle(PlainButtonStyle())
            .padding([.top, .bottom], 10)
            .frame(width:350)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 1.0))
            
            HStack{
                if self.mainViewRouter.connectedUser != nil{
                    if !isLiked(){
                        Button(action: {
                            self.post.nbLikes+=1
                            self.post.likes.append(Like(user: self.mainViewRouter.connectedUser!._id))
                            PostViewModel().likePost(_id: self.post._id, token: self.mainViewRouter.token!)
                        }){
                            Image("like_post")
                                .foregroundColor(Color.gray)
                        }
                        Text(String(self.post.nbLikes))
                    }else{
                        Button(action: {
                            self.post.nbLikes-=1
                            self.dislike()
                            PostViewModel().dislikePost(_id: self.post._id, token: self.mainViewRouter.token!)
                        }){
                            Image("like_post")
                                .foregroundColor(Color.gray)
                        }
                        Text(String(self.post.nbLikes))
                    }
                    Spacer()
                    if !isReported(){
                        Button(action: {
                            self.post.nbReports+=1
                            self.post.reports.append(Report(user: self.mainViewRouter.connectedUser!._id))
                            PostViewModel().reportPost(_id: self.post._id, token: self.mainViewRouter.token!)
                        }){
                            Image("report")
                                .foregroundColor(Color.red)
                        }
                    }else{
                        Button(action: {
                            self.showingAlert = true
                        }){
                            Image("report")
                                .foregroundColor(Color.red)
                        }.alert(isPresented: $showingAlert) {
                            Alert(title: Text("You already reported that post."), message: Text("You already reported that post."))
                        }
                    }
                }else{
                    Image("like_post")
                        .foregroundColor(Color.gray)
                    Text(String(self.post.nbLikes))
                }
            }
            .padding(10)
            .frame(width:350, height:40, alignment: .leading)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 1.0))
            
            if post.location != nil{
                Button(action: {
                    withAnimation{
                    self.mainViewRouter.showUser = false
                    self.mainViewRouter.userProfile = nil
                    self.mainViewRouter.currentPage = "search"
                    self.searchVR.searchType = "location"
                    self.searchVR.searchString = self.post.location!
                    if self.postViewRouter.showPost {self.postViewRouter.showPost.toggle()}
                    }
                }){
                    Text(String(post.location!))
                    .padding(.leading, 10)
                    .frame(width:350, height:30, alignment: .leading)
                        .background(Color.gray.opacity(0.7))
                    .foregroundColor(Color.white)
                }
            }
            
            if(!post.getTags().isEmpty){
                HStack{
                    ForEach(post.getTags(), id: \.self){ tag in
                        Button(action:{
                            self.mainViewRouter.showUser = false
                            self.mainViewRouter.userProfile = nil
                            self.mainViewRouter.currentPage = "search"
                            self.searchVR.searchType = "tags"
                            self.searchVR.searchString = tag
                            if self.postViewRouter.showPost {self.postViewRouter.showPost.toggle()}
                        }){
                            Text("#"+tag)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .padding(10)
                .frame(width:350, height:40, alignment: .leading)
                .background(Color.gray)
                .foregroundColor(Color.white)

                
            }
        }
        .cornerRadius(10)
        .shadow(radius: 3)
    }
    
    func isLiked() -> Bool{
        for like in self.post.likes{
            if like.user == self.mainViewRouter.connectedUser?._id{
                return true
            }
        }
        return false
    }
    
    func dislike(){
        for i in 0...self.post.likes.count-1{
            if self.post.likes[i].user == self.mainViewRouter.connectedUser?._id{
                self.post.likes.remove(at: i)
            }
        }
    }
    
    func isReported() -> Bool{
        for report in self.post.reports{
            if report.user == self.mainViewRouter.connectedUser?._id{
                return true
            }
        }
        return false
    }
    
}

struct PostItem_Previews: PreviewProvider {
    static var previews: some View {
        return PostItem(post: Post(tags: ["Test1","Test2"], title: "Here's my title", text: "Incredible text.\nWith several lines of incredible text, written by a litteral genius.\nLike so.", pseudo: "TestUser", user: "", location: "Montpellier, France", imagePost: ""), postViewRouter: PostViewRouter(), mainViewRouter: MainViewRouter(), searchVR: SearchViewRouter())
    }
}
