//
//  EventDetailViewModel.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

protocol EventDetailViewModelDelegate: class {
    func eventDetailViewModelDidFinishPost()
}

class EventDetailViewModel {
    
    weak var delegate: EventDetailViewModelDelegate?
    
    var event: EventModel?
    
}
