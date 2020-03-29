//
//  FirebaseManagement.swift
//  MOP
//
//  Created by user165103 on 3/29/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseStorage

class FirebaseManager{
    let storage = Storage.storage().reference()
    var imageFileName = ""
    var imageType : String
    var imageURL = ""
    
    init(imageType: String){
        self.imageType = imageType
    }
    
    func uploadImageToFirebase(image: UIImage){
        self.imageFileName = generateFileName()
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        self.storage.child(self.imageFileName).putData(image.jpegData(compressionQuality: 0.42)!, metadata: metadata){metadata, error in
            guard let metadata = metadata else {
                print(error)
                return
            }
            
        }
    }
    
    func downloadImageFromFirebase() -> String{
        self.storage.child(imageFileName).downloadURL{(url, error) in
            if error != nil{
                print(error)
                return
            }
            self.imageURL = "\(url!)"
        }
        return self.imageURL
    }

    func generateFileName() -> String {
        var ret : String
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMddHHss"
        ret = "images/" + imageType + formatter.string(from: date) + ".jpg"
        return ret
    }

    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }

}

