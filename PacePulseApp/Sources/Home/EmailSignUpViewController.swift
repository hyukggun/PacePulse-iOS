//
//  EmailSignUpViewController.swift
//  PacePulseApp
//
//  Created by hyukmac on 6/6/25.
//

import PinLayout
import Then
import UIKit

class EmailSignUpViewController: UIViewController {
    
    private let emailInputTextField = UITextField().then {
        $0.keyboardType = .emailAddress
        $0.placeholder = "Email"
    }
    
    private let pwInputTextField = UITextField().then {
        $0.keyboardType = .asciiCapableNumberPad
        $0.isSecureTextEntry = true
        $0.placeholder = "Password"
    }
    
    private let pwCheckInputTextField = UITextField().then {
        $0.keyboardType = .asciiCapableNumberPad
        $0.isSecureTextEntry = true
        $0.placeholder = "Password Check"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(emailInputTextField)
        view.addSubview(pwInputTextField)
        view.addSubview(pwCheckInputTextField)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        emailInputTextField.pin.top()
            .marginTop(10)
            .hCenter()
            .horizontally(10)
            .height(50)
            
        pwInputTextField.pin.below(of: emailInputTextField)
            .marginTop(10)
            .hCenter()
            .horizontally(10)
            .height(50)
        
        pwCheckInputTextField.pin.below(of: emailInputTextField)
            .marginTop(10)
            .hCenter()
            .horizontally(10)
            .height(50)
    }
}
