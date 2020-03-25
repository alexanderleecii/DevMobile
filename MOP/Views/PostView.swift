//
//  PostView.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct PostView: View {
    @ObservedObject var post : Post
    @ObservedObject var mainViewRouter : MainViewRouter
    @ObservedObject var postViewRouter : PostViewRouter
    @ObservedObject var searchVR : SearchViewRouter
    @ObservedObject private var keyboard = KeyboardObserver()
    
    @State private var comment = ""
    
    var body: some View {
        VStack{
            PostItem(post: post, postViewRouter: postViewRouter, mainViewRouter: self.mainViewRouter, searchVR: self.searchVR)
                .padding(.bottom, 20)
            HStack{
                Text("Comments")
                    .padding(.trailing, 10)
                Button(action: {
                    //TODO
                    self.post.orderCommentsBy(viewType: "latest")
                }){
                    Text("Latest")
                        .foregroundColor(Color.gray)
                }
                Text("|")
                Button(action: {
                    //TODO
                    self.post.orderCommentsBy(viewType: "top")
                }){
                    Text("Top")
                        .foregroundColor(Color.gray)
                }
            }.frame(width: 350, alignment: .leading)
                .padding(.bottom, -10)
            CommentsView(post: self.post, mainViewRouter: self.mainViewRouter)
            if self.mainViewRouter.connectedUser != nil{
                HStack{
                    MultilineTF(txt: self.$comment)
                        .frame(width: 300, height: 40, alignment: .leading)
                    Button(action: {
                        self.post.addComment(comment: Comment(pseudo: self.mainViewRouter.connectedUser!.pseudo, user: self.mainViewRouter.connectedUser!._id, text: self.$comment.wrappedValue), token: self.mainViewRouter.token!)
                    }){
                        Text("Comment")
                    }
                    }.padding(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth:1)
                )
                Spacer()
            }
        }.padding(.bottom, keyboard.currentHeight)
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(tags: ["Test1","Test2"], title: "Here's my title", text: "Incredible text.\nWith several lines of incredible text, written by a litteral genius.\nLike so.", pseudo: "TestUser", user: "", location: "Montpellier, France", imagePost: ""), mainViewRouter: MainViewRouter(),postViewRouter: PostViewRouter(), searchVR: SearchViewRouter())
    }
}
