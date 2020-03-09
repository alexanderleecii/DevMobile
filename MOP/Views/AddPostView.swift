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
    
    //TODO: Preventing keyboard to cover TextField's
    
    enum Options: String{
        case none, message, image, tag, location
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                TextField("post", text: $postStr)
                    .frame(height: 300.0)
                    .padding([.leading,.trailing])
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
                }
                if selectedOptions["location"]! {
                    HStack{
                        Text("Where were you?")
                        .padding(.leading)
                        TextField("", text: $location)
                        .padding(.trailing)
                        .background(Color.gray)
                        .cornerRadius(15.0)
                    }
                    .padding(.bottom, 20.0)
                    .font(.body)
                }
                if selectedOptions["image"]!{
                    VStack{
                        NavigationLink(destination: ImagePicker(isShown: self.$selectingImage, image: self.$postImage),
                                       isActive: self.$selectingImage){EmptyView()}
                        Button(action:{
                            self.selectingImage.toggle()
                        }){
                            Text("Select Image...")
                        }
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
                    
                }){
                    Text("Cancel")
                },
                trailing:
                Button(action:{
                    //TODO add to list of Posts
                    self.createNewPost()
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
        AddPostView(visible: .constant(true))
    }
}
