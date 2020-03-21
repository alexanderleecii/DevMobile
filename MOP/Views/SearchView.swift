//
//  SearchView.swift
//  MOP
//
//  Created by user165103 on 3/16/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var mainVR : MainViewRouter
    @ObservedObject var postVR : PostViewRouter
    @ObservedObject var searchVR : SearchViewRouter
    
    @ObservedObject var userVM = UserViewModel()
    @ObservedObject var postVM = PostViewModel()
    
    @State var userFilteredList = [User]()
    @State var postFilteredList = [Post]()
    //@State private var searchText : String = ""
    
    func update(){
        if self.searchVR.searchType == "people"{
            self.userFilteredList = self.userVM.getUsersContaining(substring: self.searchVR.searchString)
        }else if self.searchVR.searchType == "tags" {
            self.postFilteredList = self.postVM.getPostContaining(by: "tags", substring: self.searchVR.searchString)
        }else if self.searchVR.searchType == "location"{
            self.postFilteredList = self.postVM.getPostContaining(by: "location", substring: self.searchVR.searchString)
        }
    }
    
    var body: some View {
        
        let textFieldBinding = Binding<String> (
            get: {
                return self.searchVR.searchString
            },
            set: {
                self.searchVR.searchString = $0
                self.update()
            }
        )
        
        return VStack(alignment: .center){
            HStack{
                TextField("Search", text: textFieldBinding)
                    .foregroundColor(Color.gray.opacity(0.9))
                    .frame(width: 310, height: 40, alignment: .leading)
                Button(action: {
                    
                }){
                    Image("search")
                        .foregroundColor(Color.gray.opacity(0.9))
                }
            }
            .frame(width: 350, height: 20)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(50)
            
            HStack{
                VStack{
                    SearchButton(searchVR: self.searchVR, name: "people")
                    if self.searchVR.searchType == "people"{
                        Divider()
                        .frame(width:45)
                    }
                }
                VStack{
                    SearchButton(searchVR: self.searchVR, name: "tags")
                    if self.searchVR.searchType == "tags"{
                        Divider()
                        .frame(width:45)
                    }
                }
                VStack{
                    SearchButton(searchVR: self.searchVR, name: "location")
                    if self.searchVR.searchType == "location"{
                        Divider()
                        .frame(width:45)
                    }
                }
            }
            
            ScrollView{
                VStack(spacing: 8){
                    if self.searchVR.searchType == "people"{
                        ForEach(userFilteredList){user in
                            PersonItem(user: user)
                        }
                    }else if self.searchVR.searchType == "tags"{
                        ForEach(postFilteredList){post in
                            PostItem(post: post, postViewRouter: self.postVR, mainViewRouter: self.mainVR, searchVR: self.searchVR)
                        }
                    }else if self.searchVR.searchType == "location"{
                        ForEach(postFilteredList){post in
                            PostItem(post: post, postViewRouter: self.postVR, mainViewRouter: self.mainVR, searchVR: self.searchVR)
                        }
                    }
                    Spacer()
                }
            }
            Spacer()
        }
        .onAppear{
            self.update()
        }
    }
}

struct SearchButton: View{
    @ObservedObject var searchVR : SearchViewRouter
    var name : String
    var body: some View {
        Button(action: {
            self.searchVR.searchType = self.name
        }){
            if name == "people"{
                Image("person")
                .resizable()
                .foregroundColor(Color.gray.opacity(0.9))
                .frame(width: 45, height: 45)
            }else if name == "tags"{
                Image("hashtag")
                .resizable()
                .foregroundColor(Color.gray.opacity(0.9))
                .frame(width: 45, height: 45)
            }else if name == "location"{
                Image("location")
                .resizable()
                .foregroundColor(Color.gray.opacity(0.9))
                .frame(width: 45, height: 45)
            }
        }
        .padding([.leading, .trailing])
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(mainVR: MainViewRouter(), postVR: PostViewRouter(), searchVR: SearchViewRouter())
    }
}
