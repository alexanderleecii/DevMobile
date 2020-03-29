import SwiftUI

struct ImagePicker : UIViewControllerRepresentable {
    @Binding var isShown: Bool
    @Binding var imageURL: String
    var imageType: String
    
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
    var fbManager : FirebaseManager
    
    init(parent: ImagePicker) {
        self.parent = parent
        fbManager = FirebaseManager(imageType: parent.imageType)
    }
    
    //Image selection got cancelled
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parent.isShown.toggle()
    }
    
    //Selected Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        fbManager.uploadImageToFirebase(image: image)
        print("*********************************************************************************")
        self.parent.imageURL = fbManager.downloadImageFromFirebase()
        self.parent.isShown.toggle()
    }

}
