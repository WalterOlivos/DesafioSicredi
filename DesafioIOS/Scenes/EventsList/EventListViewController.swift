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
                
            } else {
                
            }
        }
    }
    
    private var viewModel = EventListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension EventListViewController: EventListViewModelDelegate {
    func eventListViewModelDidFinishApiRequest() {
        
        tableView.reloadData()
    }
}

extension EventListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
