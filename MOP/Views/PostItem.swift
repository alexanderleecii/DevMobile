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
    
    @State private var showingAlert = false

    var body: some View {
        VStack(spacing:0){
            Button(action: {
                self.postViewRouter.post = self.post
                self.postViewRouter.showPost = true
            }){
                Text(post.text)
                .frame(width:350, height:100)
                .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 1.0))
            }
            
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
                Text(String(post.location!))
                    .padding(.leading, 10)
                    .frame(width:350, height:30, alignment: .leading)
                .background(Color(red: 0.6, green: 0.6, blue: 0.6, opacity: 1.0))
                .foregroundColor(Color.white)
            }
            
            if(!post.getTags().isEmpty){
                HStack{
                    ForEach(post.getTags(), id: \.self){
                        tag in Text("#"+tag)
                    }
                }
                .padding(10)
                .frame(width:350, height:40, alignment: .leading)
                .background(Color(red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                .foregroundColor(Color.white)
            }
        }.cornerRadius(10)
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
        
        PostItem(post: PostViewModel().postSet[0], postViewRouter: PostViewRouter(), mainViewRouter: MainViewRouter())
    }
}
