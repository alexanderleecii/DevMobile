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
    
    //PostViewModel
    @ObservedObject var posts : PostViewModel
    
    //Binding Attribute
    @Binding var visible : Bool
    
    
    //post attributes
    @State private var postStr = ""
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
    
    enum Options: String{
        case none, message, image, tag, location
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                TextField("Write here ...", text: $postStr)
                    
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
                        self.posts.addPost(post: self.createNewPost())
                        self.visible.toggle()
                    }
                }){
                    Text("Add Post")
                })
        }
   }
    
    //TODO
    func convertImageToURL() -> String {
        return "image.url"
    }
    
    //TODO
    func convertTagStrToArray() -> [String]{
        return ["hello","goodbye"]
    }
    
    func createNewPost() -> Post {
        return Post(text: self.$postStr.wrappedValue,
                    location: self.$location.wrappedValue,
                    imgUrl: convertImageToURL(),
                    tags: convertTagStrToArray()
        )
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
        AddPostView(posts: PostViewModel(), visible: .constant(true))
    }
}
