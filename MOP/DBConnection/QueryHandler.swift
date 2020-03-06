//
//  QueryHandler.swift
//  MOP
//
//  Created by user165103 on 3/2/20.
//  Copyright © 2020 Groupe Incroyable. All rights reserved.
//

import Foundation

enum QueryError:Error{
    case noDataAvailable
    case cannotProcessData
}

class QueryHandler{
    let resourceURL: URL
    
    init(endpoint: String){
        let resourceString = "https://wouldyoureact.herokuapp.com/api/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else {
            fatalError()
        }
        self.resourceURL = resourceURL
    }
    
    func getWithId(_id: String) -> Data?{
        var request = URLRequest(url: resourceURL.appendingPathComponent(_id))
        request.httpMethod = "GET"
        var json: Data?
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error {
                print("Error \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response status code \(response.statusCode)")
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                print("Response data string: \(dataString)")
                json = data
            }
        }
        dataTask.resume()
        return json
    }
    
    func getAll(){
        var request = URLRequest(url: resourceURL)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request){ data, response, error in
            if let error = error {
                print("Error \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response status code \(response.statusCode)")
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8){
                print("Response data string: \(dataString)")
            }
        }
        dataTask.resume()
    }
}
