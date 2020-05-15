//
//  EventListViewModel.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

protocol EventListViewModelDelegate: class {
    func eventListViewModelDidFinishApiRequest()
}

class EventListViewModel {
    
    weak var delegate: EventListViewModelDelegate?
    
    var events: [EventModel] = []
    
    func fetchEvents() {
        NetworkManager.loadEventList { events in
            guard let events = events else {
                self.events = []
                return
            }
            
            self.events = events
            self.delegate?.eventListViewModelDidFinishApiRequest()
        }
    }
}
