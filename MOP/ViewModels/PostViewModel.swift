//
//  PostViewModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class PostViewModel : ObservableObject{
    @Published var postSet = [Post]()
    
    init(){
        loadAllPosts()
        
    }
     
     func getPostsOrderedBy(viewType att : String){
         if att == "latest_posts" {
            postSet.sort(by: {$0.date > $1.date})
         }
         else if att == "top_posts"{
            postSet.sort(by: {$0.nbLikes > $1.nbLikes})
         }
     }
     
    
    func loadPostWithId(_id: String, completionHandler: @escaping (_ result: Post) -> Void){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/posts/"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        var request = URLRequest(url: resourceURL.appendingPathComponent(_id))
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
    
    func loadAllPosts(){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/posts"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        /*var request = URLRequest(url: resourceURL)
        request.httpMethod = "GET"*/
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL){ (data, _, _) in
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                //print("Response data string: \(dataString)")
                let decoder = JSONDecoder()
                guard let posts = try? decoder.decode([Post].self, from: data) else {
                    return
                }
                DispatchQueue.main.async {
                    self.postSet = posts
                }
            }
        }
        dataTask.resume()
    }
    
    func addPost(post: Post){
        self.postSet.append(post)
    }
    
    func likePost(_id: String, token: String){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/posts/like/"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        var request = URLRequest(url: resourceURL.appendingPathComponent(_id))
        request.httpMethod = "PUT"
        request.addValue(token, forHTTPHeaderField: "x-auth-token")
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, response, _ in
            /*if let response = response as? HTTPURLResponse {
                print("Response status code \(response.statusCode)")
            }*/
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                //print("Response data string: \(dataString)")
            }
        }
        dataTask.resume()
    }
    
    func dislikePost(_id: String, token: String){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/posts/unlike/"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        var request = URLRequest(url: resourceURL.appendingPathComponent(_id))
        request.httpMethod = "PUT"
        request.addValue(token, forHTTPHeaderField: "x-auth-token")
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, response, _ in
            /*if let response = response as? HTTPURLResponse {
                print("Response status code \(response.statusCode)")
            }*/
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                //print("Response data string: \(dataString)")
            }
        }
        dataTask.resume()
    }
    
    func reportPost(_id: String, token: String){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/posts/report/"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        var request = URLRequest(url: resourceURL.appendingPathComponent(_id))
        request.httpMethod = "PUT"
        request.addValue(token, forHTTPHeaderField: "x-auth-token")
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, response, _ in
            /*if let response = response as? HTTPURLResponse {
                print("Response status code \(response.statusCode)")
            }*/
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                //print("Response data string: \(dataString)")
            }
        }
        dataTask.resume()
    }
    
    func likeComment(postid: String, commentid: String, token: String){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/posts/comment/like/"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        var request = URLRequest(url: resourceURL.appendingPathComponent(postid+"/"+commentid))
        request.httpMethod = "PUT"
        request.addValue(token, forHTTPHeaderField: "x-auth-token")
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, response, _ in
            if let response = response as? HTTPURLResponse {
                print("Response status code \(response.statusCode)")
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                //print("Response data string: \(dataString)")
            }
        }
        dataTask.resume()
    }
    
    func dislikeComment(postid: String, commentid:String, token: String){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/posts/comment/unlike/"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        var request = URLRequest(url: resourceURL.appendingPathComponent(postid+"/"+commentid))
        request.httpMethod = "PUT"
        request.addValue(token, forHTTPHeaderField: "x-auth-token")
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, response, _ in
            if let response = response as? HTTPURLResponse {
                print("Response status code \(response.statusCode)")
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                //print("Response data string: \(dataString)")
            }
        }
        dataTask.resume()
    }
    
    func reportComment(postid: String, commentid: String, token: String){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/posts/comment/report/"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        var request = URLRequest(url: resourceURL.appendingPathComponent(postid+"/"+commentid))
        request.httpMethod = "PUT"
        request.addValue(token, forHTTPHeaderField: "x-auth-token")
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, response, _ in
            if let response = response as? HTTPURLResponse {
                print("Response status code \(response.statusCode)")
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                //print("Response data string: \(dataString)")
            }
        }
        dataTask.resume()
    }
}
