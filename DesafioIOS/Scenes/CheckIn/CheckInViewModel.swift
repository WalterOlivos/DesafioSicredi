//
//  CheckInViewModel.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

protocol CheckInViewModelDelegate: class {
    func checkInViewModelDidCheckIn()
    func checkInViewModel(didRecieve error: String)
}

class CheckInViewModel {
    
    weak var delegate: CheckInViewModelDelegate?
    
    var event: EventModel?
    
    func checkIn(name: String, email: String){
        guard let event = event else { return }
        
        let checkInBody = CheckInModel(eventId: event.id, name: name, email: email)
        
        APIManager.CheckInRequests.postCheckIn(body: checkInBody) { (error) in
            guard let error = error else {
                self.delegate?.checkInViewModelDidCheckIn()
                return
            }
            
            self.delegate?.checkInViewModel(didRecieve: error)
        }
    }
}
