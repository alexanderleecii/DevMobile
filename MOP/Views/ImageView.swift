//
//  ImageView.swift
//  MOP
//
//  Created by user165103 on 3/21/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import SwiftUI
import Combine
import FirebaseStorage

struct ImageView: View {
    @ObservedObject var imageLoader : DataLoader
    @State var image : UIImage = UIImage()
    
    init(imageURL: String){
        self.imageLoader = DataLoader(urlString: imageURL)
    }
    
    var body: some View {
        VStack{
            Image(uiImage: self.image)
            .resizable()
        }
        .onReceive(self.imageLoader.didChange){data in
            self.image = UIImage(data : data) ?? UIImage()
        }
    }
}

class DataLoader: ObservableObject{
    @Published var didChange = PassthroughSubject<Data,Never>()
    @Published var data = Data(){
        didSet{
            self.didChange.send(data)
        }
    }
    
    init(urlString: String){
        getDataFromUrl(urlString: urlString)
    }
    
    func getDataFromUrl(urlString: String){
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url){ data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async{
                self.data = data
            }
        }.resume()
    }
}
