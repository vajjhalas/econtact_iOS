//
//  SignInViewController.swift
//  EZKontact
//
//  Created by iosdev on 13/12/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SignInViewController: UIViewController {

    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet var passwordTextField: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Sign In"
        self.headerLabel.text = "Sigin in to access your contacts and get started creating your network"
        
        // Do any additional setup after loading the view.
        
        emailTextField.placeholder = "Email"
        emailTextField.title = "Email address"
        emailTextField.errorColor = UIColor.red
        emailTextField.lineColor = Theme.violetTheme.mainColor
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        passwordTextField.placeholder = "Password"
        passwordTextField.title = "Pasword"
        passwordTextField.errorColor = UIColor.red
        passwordTextField.lineColor = Theme.violetTheme.mainColor
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    
    // This will notify us when something has changed on the textfield
    @objc func textFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text {
            
            if(textfield == emailTextField){
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                if(text.count < 3 || !text.contains("@")) {
                    floatingLabelTextField.errorMessage = "Invalid email"
                }
                else {
                    // The error message will only disappear when we reset it to nil or empty string
                    floatingLabelTextField.errorMessage = ""
                }
            }
            }
            else if(textfield == passwordTextField) {
//            let message = Comman.matches(for: "^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&])(?=.*\\d).{8,16}$", in: text)
            
             if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                if(text.count < 1) {
                    floatingLabelTextField.errorMessage = "Please enter your password"
                }
                else {
                    // The error message will only disappear when we reset it to nil or empty string
                    floatingLabelTextField.errorMessage = ""
                }
                
            }
            }
            
        }
    }
}

