//
//  APIMethods.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 19/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

extension APIManager {
    
    struct APIMethods {
        
        static func load(url: URL, withCompletion completion: @escaping (Data?, Error?) -> Void) {
            let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: .main)
            let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                completion(data, error)
            })
            task.resume()
        }
        
        static func post(url: URL, body: Data, withCompletion completion: @escaping (Data?, Error?) -> Void) {
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = body

           let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: .main)
            let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                completion(data, error)
            })
            task.resume()
        }
    
    }
}
