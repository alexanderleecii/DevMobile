//
//  ContentView.swift
//  Camera
//
//  Created by ds-mayur on 10/4/19.
//  Copyright © 2019 Mayur Rathod. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    
    @State private var showImagePicker : Bool = false
    @State private var image : Image? = nil
    
    var body: some View {
        NavigationView{
            
            VStack {
                
                image?.resizable().scaledToFit()
                
                Button("Open Camera"){
                    self.showImagePicker = true
                }.padding()
                .foregroundColor(Color.white)
                .background(Color.purple)
                .cornerRadius(10)
            }.sheet(isPresented: self.$showImagePicker){
                PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
            }
            
            .navigationBarTitle(Text("Camera"))
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var isShown    : Bool
    @Binding var image      : Image?
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> ImagePickerCordinator {
        return ImagePickerCordinator(isShown: $isShown, image: $image)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
}

class ImagePickerCordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @Binding var isShown    : Bool
    @Binding var image      : Image?
    
    init(isShown : Binding<Bool>, image: Binding<Image?>) {
        _isShown = isShown
        _image   = image
    }
    
    //Selected Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image = Image(uiImage: uiImage)
        isShown = false
    }
    
    //Image selection got cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}
