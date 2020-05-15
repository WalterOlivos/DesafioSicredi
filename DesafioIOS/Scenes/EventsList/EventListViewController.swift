//
//  ViewController.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    
    private var isLoading: Bool = false {
        didSet {
            if isLoading {
                loadIndicator.startAnimating()
                tableView.isHidden = true
            } else {
                loadIndicator.stopAnimating()
                tableView.isHidden = false
            }
        }
    }
    
    private var viewModel = EventListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.fetchEvents()
        isLoading = true
        
    }
    
}

extension EventListViewController: EventListViewModelDelegate {
    func eventListViewModelDidFinishApiRequest() {
        isLoading = false
        tableView.reloadData()
    }
}

extension EventListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.events.isEmpty {
            return 1
        } else {
            return viewModel.events.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.events.isEmpty {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "noEventsCell") else { return UITableViewCell() }
            
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventListTableViewCell else { return UITableViewCell() }
            
            let event = viewModel.events[indexPath.row]
            
            cell.eventName.text = event.title
            cell.eventDate.text = event.date.toStringDayMonth()
            cell.eventPrice.text = "R$ \(event.price.toCurrencyString(floating: 2))"
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if viewModel.events.isEmpty {
            tableView.deselectRow(at: indexPath, animated: false)
            isLoading = true
            viewModel.fetchEvents()
        } else {
            tableView.deselectRow(at: indexPath, animated: false)

            let eventDetailVC = EventDetailViewController.instantiate(event: viewModel.events[indexPath.row])
            navigationController?.pushViewController(eventDetailVC, animated: true)
        }
    }
}
