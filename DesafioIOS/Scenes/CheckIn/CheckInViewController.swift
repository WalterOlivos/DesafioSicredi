//
//  CheckInViewController.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController {

    var viewModel = CheckInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CheckInViewController {
    static func instantiate(event: EventModel) -> CheckInViewController {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CheckInViewController") as? CheckInViewController else {
            fatalError("Unexpectedly failed getting CheckInViewController from Storyboard")
        }
        
        vc.viewModel.event = event
        
        return vc
    }
}

extension CheckInViewController: UITextFieldDelegate {
    
}
