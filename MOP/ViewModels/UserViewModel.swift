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
        //getAllUsers()
        getMockUsers()
    }
    
    func getMockUsers(){
        userSet = [
            User(id: "", pseudo: "maca", email: "test", password: "test", isAdmin: false),
            User(id: "", pseudo: "macarena", email: "test", password: "test", isAdmin: false),
            User(id: "", pseudo: "alamaca", email: "test", password: "test", isAdmin: false),
            User(id: "", pseudo: "mac", email: "test", password: "test", isAdmin: false)
        ]
    }
    
    func getUsersContaining(substring: String) -> [User]{
        var res = [User]()
        res = self.userSet.filter{$0.pseudo.contains(substring)}
        return res
    }
    
    func register(pseudo: String, email: String, password: String, completionHandler: @escaping (User, String) -> ()){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/users/"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        
        let parameters = ["pseudo": pseudo, "email": email, "password": password]
        
        var request = URLRequest(url: resourceURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let dataTask = URLSession.shared.dataTask(with: request){ (data, response, error) in
            if let error = error {
                print("Error \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                //print("Response status code \(response.statusCode)")
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                //print("Response data string: \(dataString)")
                
                /*let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                let token = json!["token"] as! String
                var request = URLRequest(url: resourceURL)
                request.httpMethod = "GET"
                request.addValue(token, forHTTPHeaderField: "x-auth-token")
                
                URLSession.shared.dataTask(with: request){(data, response, _) in
                    if let response = response as? HTTPURLResponse {
                        //print("Response status code \(response.statusCode)")
                    }
                    if let data = data, let dataString = String(data: data, encoding: .utf8){
                        //print("Response data string: \(dataString)")
                        let decoder = JSONDecoder()
                        guard let user = try? decoder.decode(User.self, from: data) else {
                            return
                        }
                        
                        DispatchQueue.main.async {
                            self.connectedUser = user
                            completionHandler(user,token)
                        }
                    }
                    
                }.resume()*/
            }
        }
        dataTask.resume()
    }
    
    func login(email: String, password: String, completionHandler: @escaping (User, String) -> ()){
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
            if let error = error {
                print("Error \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                //print("Response status code \(response.statusCode)")
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                //print("Response data string: \(dataString)")
                
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                let token = json!["token"] as! String
                var request = URLRequest(url: resourceURL)
                request.httpMethod = "GET"
                request.addValue(token, forHTTPHeaderField: "x-auth-token")
                
                URLSession.shared.dataTask(with: request){(data, response, _) in
                    if let response = response as? HTTPURLResponse {
                        //print("Response status code \(response.statusCode)")
                    }
                    if let data = data, let dataString = String(data: data, encoding: .utf8){
                        //print("Response data string: \(dataString)")
                        let decoder = JSONDecoder()
                        guard let user = try? decoder.decode(User.self, from: data) else {
                            return
                        }
                        
                        DispatchQueue.main.async {
                            self.connectedUser = user
                            completionHandler(user,token)
                        }
                    }
                    
                }.resume()
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
            if let error = error {
                print("Error \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response status code \(response.statusCode)")
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8){
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
