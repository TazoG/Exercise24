//
//  ViewController.swift
//  Exercise24
//
//  Created by Tazo Gigitashvili on 25.02.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction private func signUpTapped(_ sender: UIButton) {
        guard let userName = userNameTextField.text, let password = passwordTextField.text else {
            showAlert(title: "Error", message: "Fill both fields")
            return
        }
        
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(password, forKey: "password")
        
        let storyboard = UIStoryboard(name: "SignUpViewController", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        navigationController?.pushViewController(signInVC, animated: true)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
}

