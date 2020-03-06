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
    var body: some View {
        ScrollView{
            VStack(spacing: 5){
                ForEach(self.post.comments){
                    comment in
                    CommentItem(comment: comment)
                    Spacer()
                }
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(post: PostViewModel().postSet[0])
    }
}
