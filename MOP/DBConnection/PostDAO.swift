//
//  PostDAO.swift
//  MOP
//
//  Created by user165103 on 3/2/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class PostDAO{
    let resourceURL: URL
    init(){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/posts/"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        self.resourceURL = resourceURL
    }
    
    func loadPostWithId(_id: String, completionHandler: @escaping (_ result: Post) -> Void){
        var request = URLRequest(url: self.resourceURL.appendingPathComponent(_id))
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, _, _ in
            
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                print("Response data string: \(dataString)")
                let decoder = JSONDecoder()
                guard let post = try? decoder.decode(Post.self, from: data) else {
                    return
                }
                completionHandler(post)
            }
        }
        dataTask.resume()
    }
    
    func loadAllPosts(completionHandler: @escaping (_ result: [Post]) -> Void){
        var request = URLRequest(url: self.resourceURL)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, _, _ in
            
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                //print("Response data string: \(dataString)")
                let decoder = JSONDecoder()
                guard let posts = try? decoder.decode([Post].self, from: data) else {
                    return
                }
                DispatchQueue.main.async {
                    completionHandler(posts)
                }
            }
        }
        dataTask.resume()
    }
}
