//
//  AddPostView.swift
//  MOP
//
//  Created by user165103 on 3/6/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct AddPostView: View {
    @Environment(\.presentationMode) private var presentation
    
    @ObservedObject var mainViewRouter : MainViewRouter
    
    //PostViewModel
    @ObservedObject var postVM : PostViewModel
    
    //Binding Attribute
    //@Binding var visible : Bool
    
    
    //post attributes
    @State private var title = ""
    @State private var text = ""
    @State private var location = ""
    @State private var tags = ""
    @State private var postImageURL = ""
    
    //state control variables
    @State private var selectedOptions =
        ["message": true,
          "hashtag" : false,
          "location" : false,
          "image" : false ]
    @State private var selectingImage = false
    @State private var imageAlreadySelected = false
    
    // Preventing keyboard to cover TextField's
    @ObservedObject private var keyboard = KeyboardObserver()
    
    enum Options: String{
        case none, message, image, tag, location
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Create a post")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .foregroundColor(Color.black.opacity(0.6))
                .frame(height: 50, alignment: .center)
                .padding(.top, 5)
                Divider()
                
                if !selectedOptions["message"]! && !selectedOptions["location"]! && !selectedOptions["hashtag"]! && !selectedOptions["image"]!{
                    Spacer()
                }
                
                HStack(spacing: 50){
                    MenuIcon(selectedOptions: self.$selectedOptions, menuType: "message")
                        .foregroundColor(selectedOptions["message"]! ? Color.black.opacity(0.7) : Color.gray.opacity(0.8))
                    MenuIcon(selectedOptions: self.$selectedOptions, menuType: "location")
                    .foregroundColor(selectedOptions["location"]! ? Color.black.opacity(0.7) : Color.gray.opacity(0.8))
                    MenuIcon(selectedOptions: self.$selectedOptions, menuType: "hashtag")
                    .foregroundColor(selectedOptions["hashtag"]! ? Color.black.opacity(0.7) : Color.gray.opacity(0.8))
                    MenuIcon(selectedOptions: self.$selectedOptions, menuType: "image")
                        .foregroundColor(selectedOptions["image"]! ? Color.black.opacity(0.7) : Color.gray.opacity(0.8))
                }
                .frame(width: 400, height: 50)
                .background(Color.gray.opacity(0.2))
                
                VStack{
                    if selectedOptions["message"]!{
                        VStack(alignment: .trailing){
                            TextField("Title", text: $title)
                                .frame(width: 370, height: 50)
                            Divider()
                            MultilineTF(initText: "Your post", fontSize: 17, txt: $text)
                            .frame(width: 370, height: keyboard.currentHeight == 0 ? 150 : 20, alignment: .leading)
                            
                            Spacer()
                            Text(String(text.count) + " / 350")
                                .foregroundColor(Color.gray.opacity(0.5))
                                .padding(.trailing, 20)
                        }
                        .padding(.bottom, 20)
                        .animation(.default)
                    }
                    if selectedOptions["hashtag"]!{
                        VStack(alignment: .trailing){
                            TextField("Tags", text: $tags)
                            .frame(width: 370, height: 50)
                            Text(String(tags.split(separator: " ").count) + " tags / 5")
                            .foregroundColor(Color.gray.opacity(0.5))
                            .padding(.trailing, 20)
                        }
                        .padding(.bottom, 20)
                        .animation(.default)
                    }
                    if selectedOptions["location"]! {
                        HStack{
                            TextField("Where did it happen ?", text: $location)
                            .frame(width: 370, height: 50)
                        }
                        .padding(.bottom, 20)
                        .animation(.default)
                    }
                    if selectedOptions["image"]! {
                        VStack{
                            if postImageURL != nil && postImageURL != ""{
                                ImageView(imageURL: self.postImageURL)
                                    .frame(width: 200, height: 150, alignment: .center)
                            }
                            Button(action:{
                                self.selectingImage.toggle()
                            }){
                                if !imageAlreadySelected {
                                    Text("Select image...")
                                }
                                else {
                                    Text("Replace selected image...")
                                }
                            }
                            .sheet(isPresented: self.$selectingImage, onDismiss: {
                                self.selectedOptions["image"]!.toggle()
                                self.imageAlreadySelected.toggle()
                            }){
                                ImagePicker(isShown: self.$selectingImage, imageURL: self.$postImageURL, imageType:  "post")
                        }
                            .animation(.default)
                        }
                        .padding(.bottom, 20)
                    }
                    Spacer()
                }
                .padding(.bottom, keyboard.currentHeight == 0 ? 0 : keyboard.currentHeight + 50)
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .animation(.easeOut(duration: 0.16))
            .navigationBarItems(
                trailing:
                Button(action:{
                    //TODO agregar verificaciones de que todo esta bien
                    if self.postIsCorrect() {
                        if let token = self.mainViewRouter.token{
                            self.postVM.addPost(post: self.createNewPost(), token: token)
                        }
                        
                        self.mainViewRouter.currentPage = "latest_posts"
                    }
                }){
                    Text("Add Post")
                })
        }

    }
    
    func postIsCorrect() -> Bool {
        return (isTitleCorrect() && isTextCorrect() && areTagsCorrect() && isLocationCorrect())
    }
    
    func isTitleCorrect() -> Bool{
        return (self.$title.wrappedValue != "")
    }
    
    func isTextCorrect() -> Bool{
        return (self.$text.wrappedValue != "")
    }
    
    func areTagsCorrect() -> Bool{
        return (self.convertTagStrToArray().count <= 3)
    }
    
    func isLocationCorrect() -> Bool{
        return true
    }
    
    func convertTagStrToArray() -> [String]{
        if self.$tags.wrappedValue != ""{
            return self.$tags.wrappedValue.components(separatedBy: " ")
        }else{
            return []
        }
    }
    
    func createNewPost() -> Post {
        return Post(tags: self.convertTagStrToArray(),
                    title: self.$title.wrappedValue,
                    text: self.$text.wrappedValue,
                    pseudo: self.mainViewRouter.connectedUser!.pseudo,
                    user: self.mainViewRouter.connectedUser!._id,
                    location: self.$location.wrappedValue,
                    imagePost: self.$postImageURL.wrappedValue)
    }
}

struct MenuIcon : View {
    @Binding var selectedOptions : [String : Bool]
    var menuType : String
    var body : some View{
        Button(action: {
            self.selectedOptions[self.menuType]!.toggle()
            for option in self.selectedOptions{
                if option.key != self.menuType{
                    self.selectedOptions[option.key]! = false
                }
            }
        }){
            Image(menuType)
            .resizable()
            .frame(width: 35.0, height: 35.0)
        }
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView(mainViewRouter: MainViewRouter(), postVM: PostViewModel())
    }
}
