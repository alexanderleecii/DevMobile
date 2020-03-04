//
//  MenuView.swift
//  MOP
//
//  Created by etud on 04/03/2020.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var mainViewRouter : MainViewRouter
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack{
                    Button(action: {
                        self.mainViewRouter.currentPage = "latest_posts"
                        withAnimation{
                            self.mainViewRouter.showMenu = false
                        }
                    }){
                        Text("Latest posts")
                        .foregroundColor(Color.gray)
                        .font(.headline)
                    }
                }
                .padding(.top, 100)
                HStack{
                    Button(action: {
                        self.mainViewRouter.currentPage = "top_posts"
                        withAnimation{
                            self.mainViewRouter.showMenu = false
                        }
                    }){
                        Text("Top posts")
                        .foregroundColor(Color.gray)
                        .font(.headline)

                    }
                                    }
                .padding(.top, 30)
                HStack{
                    Button(action: {
                        self.mainViewRouter.currentPage = "profile"
                        withAnimation{
                            self.mainViewRouter.showMenu = false
                        }
                    }){
                        Text("Profile")
                        .foregroundColor(Color.gray)
                        .font(.headline)
                    }
                }
                .padding(.top, 30)
                HStack{
                    Button(action: {
                        self.mainViewRouter.currentPage = "settings"
                        withAnimation{
                            self.mainViewRouter.showMenu = false
                        }
                    }){
                        Text("Settings")
                        .foregroundColor(Color.gray)
                        .font(.headline)
                    }
                }
                .padding(.top, 30)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(mainViewRouter: MainViewRouter())
    }
}
