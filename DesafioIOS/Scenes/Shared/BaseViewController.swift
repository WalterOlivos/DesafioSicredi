//
//  BaseViewController.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    func alertPopup(title: String, error: String) {
        
        let alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func donePopup(title: String, message: String, returnToRoot: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
            if returnToRoot {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
