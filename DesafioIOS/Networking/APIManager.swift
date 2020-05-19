//
//  APIService.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

struct APIManager {
    
    static let eventListUrl = URL(string: "http://5b840ba5db24a100142dcd8c.mockapi.io/api/events")!
    
    static let checkInURL = URL(string: "http://5b840ba5db24a100142dcd8c.mockapi.io/api/checkin")!
    
    static let defaultError: String = "Ocorreu um problema, tente novamente."
    
}
