//
//  SignInViewController.swift
//  Exercise24
//
//  Created by Tazo Gigitashvili on 26.02.23.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction private func signInTapped(_ sender: UIButton) {
        guard let userName = userNameTextField.text, let password = passwordTextField.text else {return}
        
        guard let storedUserName = UserDefaults.standard.string(forKey: "userName") else {return}
        guard let storedPassword = UserDefaults.standard.string(forKey: "password") else {return}
        
        if userName == storedUserName && password == storedPassword {
            let storyboard = UIStoryboard(name: "MoviesListController", bundle: nil)
            let vC = storyboard.instantiateViewController(withIdentifier: "MoviesListController") as! MoviesListController
            
            self.navigationController?.pushViewController(vC, animated: true)

        } else {
            showAlert(title: "Error", message: "Username or password is incorrect")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
