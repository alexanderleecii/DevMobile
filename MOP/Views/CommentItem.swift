//
//  CommentItem.swift
//  MOP
//
//  Created by etud on 06/03/2020.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct CommentItem: View {
    @ObservedObject var comment : Comment
    @ObservedObject var mainViewRouter : MainViewRouter
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
                    Button(action: {
                        self.comment.nbLikes+=1
                        print(self.comment.nbLikes)
                    }){
                        Image("thumbs_up")
                            .foregroundColor((self.comment.nbLikes>0) ? Color.blue : Color.gray)
                    }
                    .foregroundColor(Color.gray)
                    Text(String(self.comment.nbLikes))
                    Button(action: {
                        self.comment.nbReports+=1
                    }){
                        Image("report")
                            .foregroundColor(Color.red)
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
}

struct CommentItem_Previews: PreviewProvider {
    static var previews: some View {
        CommentItem(comment: Comment(_id: "1", nbLikes: 3, text: "Je ne suis pas du tout d'accord!!!", nbReports: 6, pseudo: "Michou"), mainViewRouter: MainViewRouter())
    }
}
