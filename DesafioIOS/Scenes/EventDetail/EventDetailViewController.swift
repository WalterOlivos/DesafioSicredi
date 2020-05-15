//
//  EventDetailViewController.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    private var viewModel = EventDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

