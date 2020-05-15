//
//  APIService.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    static let eventListUrl = URL(string: "http://5b840ba5db24a100142dcd8c.mockapi.io/api/events")!
    
    static func load(url: URL, withCompletion completion: @escaping (Data?) -> Void) {
        let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            completion(data)
        })
        task.resume()
    }
    
    static func loadEventList(completion: @escaping ([EventModel]?) -> Void) {
        load(url: NetworkManager.eventListUrl) { data in
            guard let data = data else {
                completion(nil)
                return
            }
            let eventList = try? JSONDecoder().decode([EventModel].self, from: data)
            completion(eventList)
        }
    }
    
}
