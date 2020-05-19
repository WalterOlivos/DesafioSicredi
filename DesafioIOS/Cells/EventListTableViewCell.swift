//
//  EventListTableViewCell.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

class EventListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var eventName: UILabel!
    @IBOutlet private weak var eventDate: UILabel!
    @IBOutlet private weak var eventPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        eventName.text = nil
        eventDate.text = nil
        eventPrice.text = nil
    }
    
    func load(_ event: EventModel) {
        
        eventName.text = event.title
        eventDate.text = event.date.toStringDayMonth()
        eventPrice.text = "R$ \(event.price.toCurrencyString(floating: 2))"
        
    }

}
