//
//  NetworkManager.swift
//  QuotesApp
//
//  Created by Saranvignesh Soundararajan on 16/02/23.
//

import Foundation

class NetworkManager {
    static let shared: NetworkManager = NetworkManager()
        
    public func get(urlString: String, completionBlock: @escaping(Data?,URLResponse?,Error?) -> ()) {
        guard let url = URL(string: urlString) else {
            print("Invalid url")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("The error is \(error!)")
                return
            }
            
            guard let responseData = data,
                let httpResponse = response as? HTTPURLResponse,
                200 ..< 300 ~= httpResponse.statusCode else {
                print("Error with the response, unexpected status code: \(response!)")
                return
            }
            completionBlock(responseData,response,nil)
            

        }
        task.resume()
        
    }

}
