//
//  Double+Extensions.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

extension Double {
    
    func toCurrencyString(floating:Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        formatter.maximumFractionDigits = floating
        formatter.minimumFractionDigits = 2
        
        let value = NSNumber(value: self)
        
        guard value != 0 as NSNumber else {
            return "0,00"
        }
        
        return formatter.string(from: value)!
    }
}
