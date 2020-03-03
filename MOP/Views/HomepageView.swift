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
        VStack{
            HStack{
                Image("menu")
            }
            .padding(.top, 5)
            .frame(width: 350, height: 40, alignment: .leading)
            Divider()
                .background(Color.gray)
                .frame(width:420, height:10)
            Text("Latest posts")
                .font(.title).bold()
                .frame(width: 350, height: 50, alignment: .leading)
            ScrollView{
                VStack(spacing: 15){
                    ForEach(self.posts.postSet){
                        post in
                        PostItem(post: post)
                        Spacer()
                    }
                }
            }
            HStack(spacing: 50){
                Image("home")
                Image("add")
                Image("search")
            }
            .frame(width:420, height:60)
            .background(Color.gray)
        }
        .frame(minWidth:0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity, alignment: .center)
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
