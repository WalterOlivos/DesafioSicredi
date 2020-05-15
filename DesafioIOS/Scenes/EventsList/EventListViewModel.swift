//
//  EventListViewModel.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

protocol EventListViewModelDelegate: class {
    func eventListViewModelDidGetEvents()
    func eventListViewModel(didRecieve error: String)
}

class EventListViewModel {
    
    weak var delegate: EventListViewModelDelegate?
    
    var events: [EventModel] = []
    
    func fetchEvents() {
        NetworkManager.loadEventList { events, error  in
            guard let error = error else {
                if let events = events {
                    self.events = events
                }
                self.delegate?.eventListViewModelDidGetEvents()
                return
            }
            
            self.delegate?.eventListViewModel(didRecieve: error)
        }
    }
}
