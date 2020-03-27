//
//  UserViewModel.swift
//  MOP
//
//  Created by user165103 on 2/28/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

class UserViewModel : ObservableObject{
    @Published var userSet = [User]()
    @Published var connectedUser : User? = nil
    
    init(){
        getAllUsers()
    }
    
    func getUsersContaining(substring: String) -> [User]{
        var res = [User]()
        res = self.userSet.filter{$0.pseudo.range(of: substring, options: .caseInsensitive) != nil}
        return res
    }
    
    func register(pseudo: String, email: String, password: String, avatar: String, completionHandler: @escaping (User?, String?, String?) -> ()){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/users/"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        
        let parameters = ["pseudo": pseudo, "email": email, "password": password, "avatar": avatar]
        
        var request = URLRequest(url: resourceURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let dataTask = URLSession.shared.dataTask(with: request){ (data, response, error) in
            /*if let error = error {
                print("Error \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response status code \(response.statusCode)")
            }*/
            if let data = data/*, let dataString = String(data: data, encoding: .utf8)*/{
                //print("Response data string: \(dataString)")
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                
                if let token = json!["token"]{
                    let resourceString = "https://wouldyoureact.herokuapp.com/api/auth/"
                    guard let resourceURL = URL(string: resourceString) else {
                        fatalError()
                    }
                    var request = URLRequest(url: resourceURL)
                    request.httpMethod = "GET"
                    request.addValue(token as! String, forHTTPHeaderField: "x-auth-token")
                    
                    URLSession.shared.dataTask(with: request){(data, response, _) in
                        /*if let response = response as? HTTPURLResponse {
                            print("Response status code \(response.statusCode)")
                        }*/
                        if let data = data/*, let dataString = String(data: data, encoding: .utf8)*/{
                            //print("Response data string: \(dataString)")
                            let decoder = JSONDecoder()
                            guard let user = try? decoder.decode(User.self, from: data) else {
                                return
                            }
                            
                            DispatchQueue.main.async {
                                self.connectedUser = user
                                completionHandler(user, token as! String, nil)
                            }
                        }
                        
                    }.resume()
                }else{
                    if let errors = json!["errors"] as? [[String:Any]], let msg = errors.first?["msg"] as? String{
                        completionHandler(nil, nil, msg)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    func login(email: String, password: String, completionHandler: @escaping (User?, String?, String?) -> ()){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/auth/"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        
        let parameters = ["email": email, "password": password]
        
        var request = URLRequest(url: resourceURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let dataTask = URLSession.shared.dataTask(with: request){ (data, response, error) in
            /*if let error = error {
                print("Error \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response status code \(response.statusCode)")
            }*/
            if let data = data/*, let dataString = String(data: data, encoding: .utf8)*/{
                //print("Response data string: \(dataString)")
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                
                if let token = json!["token"]{
                    var request = URLRequest(url: resourceURL)
                    request.httpMethod = "GET"
                    request.addValue(token as! String, forHTTPHeaderField: "x-auth-token")
                    
                    URLSession.shared.dataTask(with: request){(data, response, _) in
                        /*if let response = response as? HTTPURLResponse {
                            print("Response status code \(response.statusCode)")
                        }*/
                        if let data = data/*, let dataString = String(data: data, encoding: .utf8)*/{
                            //print("Response data string: \(dataString)")
                            let decoder = JSONDecoder()
                            guard let user = try? decoder.decode(User.self, from: data) else {
                                return
                            }
                            
                            DispatchQueue.main.async {
                                self.connectedUser = user
                                completionHandler(user, token as! String, nil)
                            }
                        }
                        
                    }.resume()
                }else{
                    if let errors = json!["errors"] as? [[String:Any]], let msg = errors.first?["msg"] as? String{
                        completionHandler(nil, nil, msg)
                    }
                    
                }
                
            }
        }
        dataTask.resume()
    }
    
    func getAllUsers(){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/users/"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        
        var request = URLRequest(url: resourceURL)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request){ (data, response, error) in
            /*if let error = error {
                print("Error \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response status code \(response.statusCode)")
            }*/
            if let data = data/*, let dataString = String(data: data, encoding: .utf8)*/{
                //print("Response data string: \(dataString)")
                let decoder = JSONDecoder()
                guard let users = try? decoder.decode([User].self, from: data) else {
                    return
                }
                DispatchQueue.main.async {
                    self.userSet = users
                }
            }
        }
        dataTask.resume()
    }
    
    
}
