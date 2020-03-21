import SwiftUI
import FirebaseStorage

struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var isShown: Bool
    @Binding var imageURL: String
    
    func makeCoordinator() -> ImagePickerCordinator {
        return ImagePickerCordinator(parent: self)
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
}

class ImagePickerCordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    var parent : ImagePicker
    let storage = Storage.storage().reference()
    
    init(parent: ImagePicker) {
        self.parent = parent
    }
    
    //Image selection got cancelled
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parent.isShown.toggle()
    }
    
    //Selected Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        uploadImageToFirebase(image: image, route: "/images/"+randomString(length: 12)+".jpeg")
    }
    
    func uploadImageToFirebase(image: UIImage, route: String){
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        self.storage.child(route).putData(image.jpegData(compressionQuality: 0.42)!, metadata: metadata)
        downloadImageFromFirebase(route: route)
    }
    
    func downloadImageFromFirebase(route: String){
        self.storage.child(route).downloadURL{(url, error) in
            if error != nil{
                print(error)
                return
            }
            self.parent.imageURL = "\(url!)"
            self.parent.isShown.toggle()
            
        }
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}
