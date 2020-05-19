//
//  CheckInService.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 19/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

extension APIManager {
    
    struct CheckInRequests {
        
        static func postCheckIn(body: CheckInModel, completion: @escaping (String?) -> Void) {
            do {
                let jsonData = try JSONEncoder().encode(body)
                
                APIMethods.post(url: checkInURL, body: jsonData) { data, error in
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
        
    }
}
