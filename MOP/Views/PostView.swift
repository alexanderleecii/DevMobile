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
    
    var body: some View {
        var sorted = "latest"
        return VStack{
            PostItem(post: post, postViewRouter: PostViewRouter(), mainViewRouter: self.mainViewRouter)
                .padding(.bottom, 20)
            HStack{
                Text("Comments")
                    .padding(.trailing, 10)
                Button(action: {
                    sorted = "latest"
                }){
                    Text("Latest")
                        .foregroundColor(Color.gray)
                }
                Text("|")
                Button(action: {
                    sorted = "top"
                }){
                    Text("Top")
                        .foregroundColor(Color.gray)
                }
            }.frame(width: 350, alignment: .leading)
                .padding(.bottom, -10)
            
            Divider()
            .background(Color.gray)
            .frame(width:350, height:1)
            CommentsView(post: post, mainViewRouter: self.mainViewRouter, sorted: sorted)
            Spacer()
        }
        
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(), mainViewRouter: MainViewRouter())
    }
}
