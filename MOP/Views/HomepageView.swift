//
//  HomepageView.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct HomepageView: View {
    @ObservedObject var posts = PostViewModel()
    var body: some View {
        ScrollView{
            VStack{
                ForEach(self.posts.postSet){
                    post in
                    PostItem(post: post)
                    Spacer()
                }
            }
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
