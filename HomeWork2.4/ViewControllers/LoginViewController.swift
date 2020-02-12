//
//  LoginViewController.swift
//  HomeWork2.4
//
//  Created by Alex Sander on 08.02.2020.
//  Copyright © 2020 Alex Sander. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlet

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - IB Actions

    @IBAction func loginAction() {
        guard let usernameText = usernameTextField.text,
            let passwordText = passwordTextField.text,
            !usernameText.isEmpty && !passwordText.isEmpty else {
            showAlert(with: "Textfield is empty", message: "Please enter text")
            return
        }
        
        if usernameText != User.defaultUser().username ||
            passwordText != User.defaultUser().password {
            showAlert(with: "Log in fail", message: "Username or password wrong")
            return
        }
        
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func forgotUsernameAction() {
        showAlert(with: "Hint", message: "Username: \(User.defaultUser().username)")
    }
    
    @IBAction func forgotPasswordAction() {
        showAlert(with: "Hint", message: "Password: \(User.defaultUser().password)")
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let destinationVC = tabBarController.viewControllers?.first as! HomeViewController
        destinationVC.username = usernameTextField.text
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        usernameTextField.text = nil
        passwordTextField.text = nil
    }
}

// MARK: - UIAlertController
extension LoginViewController {
    
    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: Text Field Delegate
extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            loginAction()
        }
        return true
    }
}
