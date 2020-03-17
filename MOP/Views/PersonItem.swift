//
//  PersonItem.swift
//  MOP
//
//  Created by user165103 on 3/17/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct PersonItem: View {
    @ObservedObject var user : User
    
    var body: some View {
        VStack(spacing:0){
            Button(action: {
                
            }){
                HStack{
                    Circle()
                        .padding(5)
                        .foregroundColor(Color.gray.opacity(0.6))
                    Spacer()
                    VStack(alignment: .leading){
                        Text(self.user.pseudo)
                            .padding(.bottom, 30)
                            .font(.system(size: 20, weight: .regular, design: .default))
                            .foregroundColor(Color.black)
                        Text("Nb posts")
                            .font(.system(size: 18, weight: .thin, design: .default))
                    }
                    .frame(width:250, alignment: .leading)
                }
                .frame(alignment: .leading)
            }
            .foregroundColor(Color.gray)
        }
        .frame(width: 350, height: 90)
        .overlay(RoundedRectangle(cornerRadius: 40)
        .stroke(Color.gray.opacity(0.3), lineWidth:1.4)
        )
    }
}

struct PersonItem_Previews: PreviewProvider {
    static var previews: some View {
        PersonItem(user: User(id: "", pseudo: "test", email: "test", password: "test", isAdmin: false))
    }
}
