//
//  ViewController.swift
//  LoginApp
//
//  Created by OSIIOSdev on 06.04.2025.
//

import UIKit

final class LoginViewController: UIViewController {

    // MARK: - @IBOutlets
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    
    @IBOutlet var forgotUsernameButton: UIButton!
    
    
    // MARK: - Private properties
    
    private let username = "Username"
    private let password = "Password"
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    // MARK: - Override methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard passwordTextField.text == password && usernameTextField.text == username else {
            
            getAlertController(title: "Wrong user data", message: "Please, enter correct login and password")
            
            return }
        
        guard let greatingVC = segue.destination as? GreatingViewController else { return }
        
        greatingVC.user = username
        
    }
    
    
    // MARK: - @IBActions
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let loginVC = segue.destination as? LoginViewController else { return }
        loginVC.passwordTextField.text = ""
                
    }
    
    @IBAction func logInButtonPressed() {
        
        guard usernameTextField.text == username, passwordTextField.text == password else {
            
            getAlertController(title: "Wrong username or password 😢",
                               message: "Please enter correct username and password")
            
            return
        }
        
        performSegue(withIdentifier: "OpenGreetingVC", sender: nil)
        
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        sender.tag == 0 ? getAlertController(title: "Forgot username 😢", message: "Your username is: \(username)") : getAlertController(title: "Forgot password 😢", message: "Your password is: \(password)")
    }
    
    // MARK: - Private methods

    private func getAlertController(title: String, message: String, textField: UITextField? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alertController.addAction(okAction)
        
        present(alertController, animated: true)
        
    }
}

