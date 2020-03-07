//
//  AddPostView.swift
//  MOP
//
//  Created by user165103 on 3/6/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI

struct AddPostView: View {
    @Environment(\.presentationMode) var presentation
    @State var postStr = ""
    @State var option = "image"
    @State var location = ""
    @State var selectingImage = false
    @State var postImage : Image?
    var body: some View {
            VStack{	
                HStack{
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }){
                        Text("Cancel")
                    }
                    Spacer()
                    Button(action: {
                        }){
                        Text("Add")
                    }
                }
                .padding([.leading, .trailing, .top], 25.0)
                Rectangle()
                    .frame( height: 1)
                TextField("post", text: $postStr)
                    .frame(height: 300.0)
                    .padding([.leading,.trailing])
                Spacer()
                
                if option=="message"{
                    
                }else if option == "location" {
                    HStack{
                        Text("Where were you?")
                        .padding(.leading)
                        TextField("qsdqsd", text: $location)
                        .padding(.trailing)
                    }
                    .padding(.bottom, 50.0)
                    .font(.body)
                }else if option == "tags" {
                    
                }else if option == "image"{
                    Button(action:{
                        self.selectingImage.toggle()
                    }){
                        Text("Select Image")
                    }.sheet(isPresented: $selectingImage){
                        PhotoCaptureView(showImagePicker: self.$selectingImage, image: self.$postImage)
                        
                    }
                }
                
                HStack{
                    HStack(spacing: 50){
                        Image("message")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                        Image("location")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                        Image("gallery")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                    }
                    

                }

            }

   }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
