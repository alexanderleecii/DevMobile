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
        //postSet.append(Post()) //Loading doesn't work otherwise
        
        /*let p1 = Post(text: "First Post according time, third according likes", nbLikes:1, nbReports:0 )
        let p2 = Post(text: "Second Post according time, second according likes", nbLikes:2, nbReports:1 )
        let p3 = Post(text: "Third Post according time, first according likes", nbLikes:4000, nbReports:1 )

        
        let d = Date()
        let d2 = d.addingTimeInterval(1000)
        let d3 = d2.addingTimeInterval(1000)
        let d4 = d3.addingTimeInterval(1000)
        
        let p1 = Post(text: "Third according time, third according likes", nbLikes:1, nbReports:0 , date:d2)
        let p2 = Post(text: "Second Post according time, first according likes", nbLikes:3, nbReports:1, date:d3)
        let p3 = Post(text: "First Post according time, second according likes", nbLikes:2, nbReports:1, date:d4)
        let p4 = Post(text: "Forth Post according time, Forth according likes", nbLikes:0, nbReports:1, date:d)
        
        postSet.append(p4)
        postSet.append(p1)
        postSet.append(p2)
        postSet.append(p3)
        
        postSet.forEach{ post in
            print(post.text, post.date)
        }
        print("*********************")
        postSet = self.getPostsOrderedBy(viewType: "latest_posts")
        
        
        postSet.forEach{ post in
            print(post.text, post.date)
        }
        print("*********************")
        postSet = self.getPostsOrderedBy(viewType: "top_posts")
         */

        /*
        let p1 = Post(text: "C'est pas cool", nbLikes:1, nbReports:0 )
        let p2 = Post(text: "Courage ma chérie", nbLikes:2, nbReports:1 )
        
        let c1 = Comment(_id: "1", nbLikes: 3, text: "Je ne suis pas du tout d'accord!!!", nbReports: 6, pseudo: "Michou")
        let c2 = Comment(_id: "2", nbLikes: 0, text: "Vous devriez retourner à l'école.", nbReports: 0, pseudo: "Polo")
        let c3 = Comment(_id: "3", nbLikes: 1, text: "Je vous conseille 'Cinq Psychanalyses' de Sigmund Freud. Très bonne lecture", nbReports: 0, pseudo: "Jean-Eudes")
        
        p1.comments.append(c1)
        p1.comments.append(c2)
        p1.comments.append(c3)
        
        postSet.append(p1)
        postSet.append(p2)
        postSet[0].addTag(tag: "#Test")
        postSet[0].addTag(tag: "#Test2")
        postSet[0].addLocation(loc:"Montpellier, France")
        postSet[1].addTag(tag: "#Ribonucleico")
        postSet[1].addLocation(loc:"Egipt, Rio du Janeiro")*/
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
}
