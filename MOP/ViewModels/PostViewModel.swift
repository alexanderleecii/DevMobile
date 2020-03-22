//
//  PostViewModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation
import Combine

class PostViewModel : ObservableObject{
    @Published var postSet = [Post]()
    
    public let objectWillChange = PassthroughSubject<[Post],Never>()
    
    init(){
        loadAllPosts()
    }
    
    func getPostContaining(by:String, substring: String) -> [Post]{
        var res = [Post]()
        if by == "tags" {
            res = self.postSet.filter{
                return !$0.tags.filter{tag in
                    return tag.range(of: substring, options: .caseInsensitive) != nil}.isEmpty
            }
        }
        else if by == "location" {
            res = self.postSet.filter{
                if let loc = $0.location {
                    return loc.range(of: substring, options: .caseInsensitive) != nil
                }
                else {return false}
            }
        }
        return res
    }
    


     func getPostsOrderedBy(viewType att : String){
         if att == "latest_posts" {
            postSet.sort(by: {$0.date > $1.date})
         }
         else if att == "top_posts"{
            postSet.sort(by: {$0.nbLikes > $1.nbLikes})
         }
     }
    
    func getUserPosts(_id: String) -> [Post]{
        let userPosts = self.postSet.filter{$0.user == _id}
        return userPosts
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
                //print("Response data string: \(dataString)")
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
                    self.objectWillChange.send(posts)
                }
            }
        }
        dataTask.resume()
    }
    
    func addPost(post: Post, token: String){
        self.postSet.append(post)
        let encoder = JSONEncoder()
        let jsondata = try! encoder.encode(post)
        
        let resourceString = "https://wouldyoureact.herokuapp.com/api/posts/"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        var request = URLRequest(url: resourceURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(token, forHTTPHeaderField: "x-auth-token")
        request.httpBody = jsondata
        //print(String(data: request.httpBody!, encoding: .utf8)!)
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, response, error in
            if let response = response as? HTTPURLResponse {
                //print("Response status code \(response.statusCode)")
            }
            if let error = error {
                //print("Error \(error)")
                return
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                //print("Response data string: \(dataString)")
            }
        }
        dataTask.resume()
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
    
    func addComment(postid: String, comment: Comment, token: String){
        let encoder = JSONEncoder()
        let jsondata = try! encoder.encode(comment)
        print(String(data: jsondata, encoding: .utf8)!)
        
        let resourceString = "https://wouldyoureact.herokuapp.com/api/posts/comment"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        var request = URLRequest(url: resourceURL.appendingPathComponent(postid))
        request.httpMethod = "POST"
        request.addValue(token, forHTTPHeaderField: "x-auth-token")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsondata
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, response, error in
            if let response = response as? HTTPURLResponse {
                //print("Response status code \(response.statusCode)")
            }
            if let error = error {
                //print("Error \(error)")
                return
            }
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
                //print("Response status code \(response.statusCode)")
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
                //print("Response status code \(response.statusCode)")
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
                //print("Response status code \(response.statusCode)")
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                //print("Response data string: \(dataString)")
            }
        }
        dataTask.resume()
    }
}
