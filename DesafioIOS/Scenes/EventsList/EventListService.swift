//
//  EventListService.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 19/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

extension APIManager {
    
    struct EventListRequests {
        
        static func loadEventList(completion: @escaping ([EventModel]?, String?) -> Void) {
            APIMethods.load(url: eventListUrl) { data, error in
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
}
