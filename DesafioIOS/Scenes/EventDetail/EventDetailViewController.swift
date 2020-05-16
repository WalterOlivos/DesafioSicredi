//
//  EventDetailViewController.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

class EventDetailViewController: BaseViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var priceLabel: UILabel!
    
    private var event: EventModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        guard let event = event else {
            return
        }
        
        titleLabel.text = event.title
        dateLabel.text = event.date.toStringDayMonth()
        priceLabel.text = "R$ \(event.price.toCurrencyString(floating: 2))"
        descriptionTextView.text = event.description
        
        eventImageView.load(url: event.image)
    }
    
    @IBAction func didTapCheckIn(_ sender: UIButton) {
        guard let event = event else { return }
        let eventCheckIn = CheckInViewController.instantiate(event: event)
        navigationController?.pushViewController(eventCheckIn, animated: true)
    }
}

extension EventDetailViewController {
    static func instantiate(event: EventModel) -> EventDetailViewController {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EventDetailViewController") as? EventDetailViewController else {
            fatalError("Unexpectedly failed getting EventDetailViewController from Storyboard")
        }
        
        vc.event = event
        
        return vc
    }
}

