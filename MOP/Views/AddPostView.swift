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
    @ObservedObject var posts : PostViewModel
    
    //Binding Attribute
    @Binding var visible : Bool
    
    
    //post attributes
    @State private var title = ""
    @State private var text = ""
    @State private var location = ""
    @State private var tags = ""
    @State private var postImage : Image?
    
    //state control variables
    @State private var selectedOptions =
        [ "message": false,
          "hashtag" : false,
          "location" : false,
          "image" : false ]
    @State private var selectingImage = false
    @State private var imageAlreadySelected = false
    
    //TODO: Preventing keyboard to cover TextField's
    @ObservedObject private var keyboard = KeyboardObserver()
    
    enum Options: String{
        case none, message, image, tag, location
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                TextField("Title", text: $title)
                    
                //.frame(height: 300.0)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius:30.0).stroke(Color.blue, lineWidth:1))
                    .padding([.leading,.trailing,.top, .bottom], 40)
                
                TextField("Post", text: $text)
                    
                //.frame(height: 300.0)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(RoundedRectangle(cornerRadius:30.0).stroke(Color.blue, lineWidth:1))
                    .padding([.leading,.trailing,.top, .bottom], 40)
                    //.multilineTextAlignment(.leading)
                    //.font(.headline)
                if postImage != nil{
                    postImage!
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                }
                Spacer()
                if selectedOptions["hashtag"]!{
                    HStack{
                        Text("Tags")
                        .padding(.leading)
                        TextField("", text: $tags)
                        .padding(.trailing)
                        .background(Color.gray)
                        .cornerRadius(15.0)
                    }
                    .animation(.default)
                }
                if selectedOptions["location"]! {
                    HStack{
                        Text("Where were you?")
                        .padding(.leading)
                        TextField("", text: $location)
                        .padding(.trailing)
                        .background(Color.gray)
                        .cornerRadius(15.0)
                        .animation(.default)
                    }
                    .padding(.bottom, 20.0)
                    .font(.body)
                }
                if selectedOptions["image"]! {
                    VStack{
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
                        ImagePicker(isShown: self.$selectingImage, image: self.$postImage)
                    }
                        .animation(.default)
                    }
                }
                HStack(spacing: 50){
                    MenuIcon(selectedOptions: self.$selectedOptions, menuType: "message")
                    MenuIcon(selectedOptions: self.$selectedOptions, menuType: "location")
                    MenuIcon(selectedOptions: self.$selectedOptions, menuType: "hashtag")
                    MenuIcon(selectedOptions: self.$selectedOptions, menuType: "image")
                }
            }
            .padding(.bottom, keyboard.currentHeight)
            .animation(.easeOut(duration: 0.16))
            .navigationBarTitle(Text("New Post"))
            .navigationBarItems(
                leading:
                Button(action:{
                    self.visible.toggle()
                }){
                    Text("Cancel")
                },
                trailing:
                Button(action:{
                    //TODO agregar verificaciones de que todo esta bien
                    if true{
                        //Add to list of Posts
                        self.posts.addPost(post: self.createNewPost(), token: self.mainViewRouter.token!)
                        self.visible.toggle()
                    }
                }){
                    Text("Add Post")
                })
        }
        
   }
    
    //TODO
    func convertImageToURL() -> String {
        if self.$postImage.wrappedValue != nil{
            return "image.url"
        }else{
            return ""
        }
    }
    
    //TODO
    func convertTagStrToArray() -> [String]{
        if self.$tags.wrappedValue != ""{
            return self.$tags.wrappedValue.components(separatedBy: " ")
        }else{
            return []
        }
    }
    
    func createNewPost() -> Post {
        return Post(tags: self.convertTagStrToArray(), title: self.$title.wrappedValue, text: self.$text.wrappedValue, pseudo: self.mainViewRouter.connectedUser!.pseudo, user: self.mainViewRouter.connectedUser!._id,
                    location: self.$location.wrappedValue,
                    imgUrl: self.convertImageToURL())
    }
}

struct MenuIcon : View {
    @Binding var selectedOptions : [String : Bool]
    var menuType : String
    var body : some View{
        Button(action: {
            self.selectedOptions[self.menuType]!.toggle()
        }){
            Image(menuType)
            .resizable()
            .frame(width: 35.0, height: 35.0)
            .foregroundColor(.black)
        }
    }
    
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView(mainViewRouter: MainViewRouter(), posts: PostViewModel(), visible: .constant(true))
    }
}
