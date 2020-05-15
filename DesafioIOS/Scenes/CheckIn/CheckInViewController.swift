//
//  CheckInViewController.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var checkInButton: UIButton!
    
    var viewModel = CheckInViewModel()
    
    private var isLoading: Bool = false {
        didSet {
            if isLoading {
                loadIndicator.startAnimating()
                checkInButton.isHidden = true
            } else {
                loadIndicator.stopAnimating()
                checkInButton.isHidden = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        viewModel.delegate = self
        
        isLoading = false
        
    }
    
    @IBAction func didTapCheckInButton(_ sender: UIButton) {
        if textsAreValid() {
            checkIn()
        }
    }
    
    private func textsAreValid() -> Bool {
        if nameTextField.text == "" {
            alertPopup(title: "Ops!", error: "Favor digitar nome.")
            return false
        }
        
        if let email = emailTextField.text {
            if email.isValidEmail {
                return true
            } else {
                alertPopup(title: "Ops!", error: "E-mail inválido.")
                return false
            }
        } else {
            alertPopup(title: "Ops!", error: "Favor digitar e-mail.")
            return false
        }
    }
    
    private func checkIn() {
        if let name = nameTextField.text, let email = emailTextField.text {
            viewModel.checkIn(name: name, email: email)
            isLoading = true
        }
    }
    
    private func alertPopup(title: String, error: String) {
        
        let alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func donePopup(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension CheckInViewController: CheckInViewModelDelegate {
    func checkInViewModelDidCheckIn() {
        donePopup(title: "Tudo certo!", message: "Check In feito com sucesso")
        isLoading = false
    }
    
    func checkInViewModel(didRecieve error: String) {
        alertPopup(title: "Ops!", error: error)
        isLoading = false
    }
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            emailTextField.becomeFirstResponder()
        } else {
            view.endEditing(true)
            if textsAreValid() {
                checkIn()
            }
        }
        return false
    }
}
