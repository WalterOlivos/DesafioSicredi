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
        return viewModel.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        navigationController?.performSegue(withIdentifier: "showEventInfoSegue", sender: self)
//        navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
}
