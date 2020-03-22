import SwiftUI
import FirebaseStorage

struct ImagePicker : UIViewControllerRepresentable {
    
    @Binding var isShown: Bool
    @Binding var imageURL: String
    @State var imageFileName : String = ""
    
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
        parent.imageFileName = generateFileName()
        uploadImageToFirebase(image: image)
    }
    
    func uploadImageToFirebase(image: UIImage){
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        self.storage.child(parent.imageFileName).putData(image.jpegData(compressionQuality: 0.42)!, metadata: metadata){metadata, error in
            guard let metadata = metadata else {
                print(error)
                return
            }
            self.downloadImageFromFirebase()
        }
        
    }
    
    func downloadImageFromFirebase(){
        self.storage.child(parent.imageFileName).downloadURL{(url, error) in
            if error != nil{
                print(error)
                return
            }
            self.parent.imageURL = "\(url!)"
            self.parent.isShown.toggle()
            
        }
    }
    
    func generateFileName() -> String {
        var ret : String
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHss"
        ret = "images/avatar"+formatter.string(from: date)+".jpg"
        return ret
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}
