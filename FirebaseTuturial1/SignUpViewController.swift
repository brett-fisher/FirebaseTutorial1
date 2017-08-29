//
//  SignUpViewController.swift
//  FirebaseTuturial1
//
//  Created by Brett Fisher on 8/29/17.
//  Copyright © 2017 Fish. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func createAccountAction(_ sender: Any) {
        
        if emailTextField.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        } else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    print("Sign up successful")
                    let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LogIn")
                    self.present(viewController!, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .cancel , handler: nil)
                    alert.addAction(action)
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
