//
//  EventDetailViewController.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    private var viewModel = EventDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        guard let event = viewModel.event else {
            return
        }
        
        titleLabel.text = event.title
        dateLabel.text = event.date.toStringDayMonth()
        priceLabel.text = "R$ \(event.price.toCurrencyString(floating: 2))"
        descriptionLabel.text = event.description
        
        eventImageView.load(url: event.image)
    }
}

extension EventDetailViewController {
    static func instantiate(event: EventModel) -> EventDetailViewController {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EventDetailViewController") as? EventDetailViewController else {
            fatalError("Unexpectedly failed getting CharacterViewController from Storyboard")
        }
        
        vc.viewModel.event = event
        
        return vc
    }
}

