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
                MenuButton(mainViewRouter: self.mainViewRouter, name: "Latest posts")
                .padding(.top, 100)
                MenuButton(mainViewRouter: self.mainViewRouter, name: "Top posts")
                .padding(.top, 30)
                MenuButton(mainViewRouter: self.mainViewRouter, name: "Profile")
                .padding(.top, 30)
                MenuButton(mainViewRouter: self.mainViewRouter, name: "Settings")
                .padding(.top, 30)
                // logic for when a user is logged = Sign Out - not logged Log In or Sign In
                MenuButton(mainViewRouter: self.mainViewRouter, name: "Log In")
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


struct MenuButton : View {
    @ObservedObject var mainViewRouter : MainViewRouter
    var name : String
    var body : some View{
        HStack{
            Button(action: {
                self.mainViewRouter.currentPage = String(self.name.lowercased().replacingOccurrences(of: " ", with: "_"))
                withAnimation{
                    self.mainViewRouter.showMenu = false
                }
            }){
                Text(name)
                .foregroundColor(Color.gray)
                .font(.headline)
            }
        }
    }
}
 

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(mainViewRouter: MainViewRouter())
    }
}
