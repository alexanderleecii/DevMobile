//
//  CommentItem.swift
//  MOP
//
//  Created by etud on 06/03/2020.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct CommentItem: View {
    @ObservedObject var post : Post
    @ObservedObject var comment : Comment
    @ObservedObject var mainViewRouter : MainViewRouter
    
    @State private var showingAlert = false
    var body: some View {
        VStack(alignment: .leading){
            Text(self.comment.text)
                .frame(width:350, height:70, alignment: .topLeading)
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4, opacity: 1.0))
            
            HStack{
                Text(self.comment.pseudo)
                    .fontWeight(.thin)
                    .italic()
                Spacer()
                if self.mainViewRouter.connectedUser != nil{
                    if !isLiked(){
                        Button(action: {
                            self.comment.nbLikes+=1
                            self.comment.likes.append(Like(user: self.mainViewRouter.connectedUser!._id))
                            PostViewModel().likeComment(postid: self.post._id, commentid: self.comment._id, token: self.mainViewRouter.token!)
                        }){
                            Image("thumbs_up")
                                .foregroundColor(Color.gray)
                        }
                        .foregroundColor(Color.gray)
                    }else{
                        Button(action: {
                            self.comment.nbLikes-=1
                            self.dislike()
                            PostViewModel().dislikeComment(postid: self.post._id, commentid: self.comment._id, token: self.mainViewRouter.token!)
                        }){
                            Image("thumbs_up")
                                .foregroundColor(Color.blue)
                        }
                    }
                    
                    Text(String(self.comment.nbLikes))
                    if !isReported(){
                        Button(action: {
                            self.comment.nbReports+=1
                            PostViewModel().reportComment(postid: self.post._id, commentid: self.comment._id, token: self.mainViewRouter.token!)
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
                            Alert(title: Text("You already reported that comment."), message: Text("You already reported that comment."))
                        }
                    }
                    
                }else{
                    Image("thumbs_up")
                        .foregroundColor(Color.gray)
                    Text(String(self.comment.nbLikes))
                }
            }
            .frame(width:350, height:40, alignment: .trailing)
            .padding(.bottom, -10)
            
            Divider()
            .background(Color.gray)
            .frame(width:350, height:1)
        }.background(Color(red: 0.98, green: 0.98, blue: 0.98, opacity: 1.0))
    }
    
    func isLiked() -> Bool{
        for like in self.comment.likes{
            if like.user == self.mainViewRouter.connectedUser?._id{
                return true
            }
        }
        return false
    }
    
    func dislike(){
        for i in 0...self.comment.likes.count-1{
            if self.comment.likes[i].user == self.mainViewRouter.connectedUser?._id{
                self.comment.likes.remove(at: i)
            }
        }
    }
    
    func isReported() -> Bool{
        for report in self.comment.reports{
            if report.user == self.mainViewRouter.connectedUser?._id{
                return true
            }
        }
        return false
    }
}

struct CommentItem_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello world")
    }
}
