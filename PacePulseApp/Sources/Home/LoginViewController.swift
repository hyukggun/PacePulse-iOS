//
//  LoginViewController.swift
//  PacePulse-App
//
//  Created by hyukmac on 5/12/25.
//

import PacePulseCore
import PinLayout
import Then
import UIKit

class LoginViewController: UIViewController {
    
    private let idLabel = UILabel().then {
        $0.text = "ID"
        $0.textColor = .black
    }
    
    private let idTextField = UITextField().then {
        $0.placeholder = "ID"
        $0.textColor = .black
    }
    
    private let pwLabel = UILabel().then {
        $0.text = "PW"
        $0.textColor = .black
    }
    
    private let pwTextField = UITextField().then {
        $0.placeholder = "PW"
        $0.textColor = .black
    }
    
    private let signInButton = UIButton().then {
        $0.setTitle("Sign In", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(idLabel)
        view.addSubview(idTextField)
        view.addSubview(pwLabel)
        view.addSubview(pwTextField)
        view.addSubview(signInButton)
        
        signInButton.addTarget(self, action: #selector(goToSignIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        idLabel.pin.vCenter()
            .hCenter()
            .marginBottom(10)
            .height(50)
            .sizeToFit(.height)
            .layout()
        
        idTextField.pin.hCenter()
            .below(of: idLabel)
            .marginTop(10)
            .height(50)
            .horizontally(10)
            .layout()
        
        pwLabel.pin.hCenter()
            .below(of: idTextField)
            .marginTop(10)
            .height(50)
            .sizeToFit(.height)
            .layout()
        
        pwTextField.pin.hCenter()
            .below(of: pwLabel)
            .marginTop(10)
            .height(50)
            .horizontally(10)
            .layout()
        
        signInButton.pin.hCenter()
            .bottom()
            .marginBottom(10)
            .size(100)
            .layout()
    }
    
    @objc
    private func goToSignIn() {
        let emailSignInVC = EmailSignUpViewController()
        present(emailSignInVC, animated: false)
    }
}
