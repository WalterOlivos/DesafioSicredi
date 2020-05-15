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
    func checkInViewModelDidNotCheckIn()
}

class CheckInViewModel {
    
    var event: EventModel?
    
}
