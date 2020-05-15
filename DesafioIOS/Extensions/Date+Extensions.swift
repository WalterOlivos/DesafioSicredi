//
//  Date+Extensions.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

extension Date {

    func toStringDate() -> String{
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd/MM/YYYY"
        
        return dataFormatter.string(from: self)
    }
    
    func toStringDayMonth() -> String{
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd/MM"

        return dataFormatter.string(from: self)
    }
}
