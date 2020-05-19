//
//  ViewController.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

class EventListViewController: BaseViewController {
    
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        viewModel.fetchEvents()
        isLoading = true
    }
    
}

extension EventListViewController: EventListViewModelDelegate {
    func eventListViewModelDidGetEvents() {
        isLoading = false
        tableView.reloadData()
    }
    
    func eventListViewModel(didRecieve error: String) {
        isLoading = false
        tableView.reloadData()
        alertPopup(title: "Ops!", error: error)
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
            
            cell.load(event)
            
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
