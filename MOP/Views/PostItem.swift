//
//  PostItem.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct PostItem: View {
    var post : Post
    
    var body: some View {
        VStack{
            Text(post.text)
                .frame(width:300, height:100)
                .background(Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 1.0))
            
            if post.location != nil{
                Text(String(post.location!))
                .frame(width:300, height:30)
                .background(Color(red: 0.6, green: 0.6, blue: 0.6, opacity: 1.0))
                    .foregroundColor(Color.white)
            }
            
            ForEach(post.getTags(), id: \.self){
                tag in Text(tag)
                    .frame(width:300,height:40)
                .background(Color(red: 0.8, green: 0.8, blue: 0.8, opacity: 1.0))
                    .foregroundColor(Color.white)
                
            }
        }.cornerRadius(10)
            .shadow(radius:5)
        
    }
}

struct PostItem_Previews: PreviewProvider {
    static var previews: some View {
        
        PostItem(post: PostViewModel().postSet[0])
    }
}
