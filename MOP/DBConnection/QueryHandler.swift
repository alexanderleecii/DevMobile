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
    
    func load(_id: String, completion: @escaping(Result<User, QueryError>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL.appendingPathComponent(_id)){ data, _, _ in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                return
            }
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode(User.self, from: jsonData)
                completion(.success(response))
            }catch{
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
    }
}
