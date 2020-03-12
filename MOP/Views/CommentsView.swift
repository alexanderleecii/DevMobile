//
//  CommentsView.swift
//  MOP
//
//  Created by etud on 06/03/2020.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct CommentsView: View {
    @ObservedObject var post : Post
    @ObservedObject var mainViewRouter : MainViewRouter
    
    var body: some View {
        ScrollView{
            VStack(spacing: 5){
                ForEach(self.post.comments){
                    comment in
                    CommentItem(comment: comment, mainViewRouter: self.mainViewRouter)
                    Spacer()
                }
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(post: PostViewModel().postSet[0], mainViewRouter: MainViewRouter())
    }
}
