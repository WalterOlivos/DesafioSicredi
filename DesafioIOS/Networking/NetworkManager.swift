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
    
    static let checkInURL = URL(string: "http://5b840ba5db24a100142dcd8c.mockapi.io/api/checkin")!
    
    static let defaultError: String = "Ocorreu um problema, tente novamente."
    
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
    
    static func postCheckIn(body: CheckInModel, completion: @escaping (String?) -> Void) {
        do {
            let jsonData = try JSONEncoder().encode(body)
            
            post(url: checkInURL, body: jsonData) { data, error in
                guard let error = error else {
                    completion(nil)
                    return
                }
                completion(error.localizedDescription)
                return
            }
        } catch {
            print(error.localizedDescription)
            completion(defaultError)
        }
    }
    
    static func loadEventList(completion: @escaping ([EventModel]?, String?) -> Void) {
        load(url: eventListUrl) { data, error in
            guard let error = error else {
                guard let data = data else {
                    completion(nil, defaultError)
                    return
                }
                do {
                    let eventList = try JSONDecoder().decode([EventModel].self, from: data)
                    completion(eventList, nil)
                    return
                } catch {
                    print(error.localizedDescription)
                    completion(nil, defaultError)
                    return
                }
            }
            completion(nil, error.localizedDescription)
            return
        }
    }
    
}
