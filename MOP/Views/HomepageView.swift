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
                    Text(post.text)
                        .frame(width:328, height:125)
                    .padding()
                    .shadow(radius: 10)
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
