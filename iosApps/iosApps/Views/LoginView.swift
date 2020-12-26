//
//  LoginView.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/12/2020.
//

import Foundation
import UIKit

class LoginView: UIView {

    var stackView: UIStackView!
    var emailTF: UITextField!
    var passwordTF: UITextField!
    var loginBtn: UIButton!
    var registreerLabel: UILabel!
    var errorLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
            
        backgroundColor = UIColor.background()
        
        emailTF = UITextField()
        emailTF.textColor = UIColor.text()
        emailTF.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.accent()])

        passwordTF = UITextField()
        passwordTF.isSecureTextEntry = true
        passwordTF.textColor = UIColor.text()
        passwordTF.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.accent()])

        
        loginBtn = UIButton.choiceButton()
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.layer.cornerRadius = 30
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loginBtn)

        errorLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:21))
        errorLabel.text = "Entered credentials incorrent. Try again."
        errorLabel.textColor = UIColor.text()
        errorLabel.textAlignment = .center
        errorLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.isHidden = true
        addSubview(errorLabel)
        
        registreerLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:21))
        registreerLabel.text = "Sign up here"
        registreerLabel.textColor = UIColor.text()
        registreerLabel.textAlignment = .center
        registreerLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        registreerLabel.isUserInteractionEnabled = true
        registreerLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(registreerLabel)
        
        stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 30.0
        stackView.axis = .vertical
        stackView.addArrangedSubview(emailTF)
        stackView.addArrangedSubview(passwordTF)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            errorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            errorLabel.widthAnchor.constraint(equalTo: loginBtn.widthAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: loginBtn.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            loginBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginBtn.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            loginBtn.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            loginBtn.bottomAnchor.constraint(equalTo: registreerLabel.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            registreerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            registreerLabel.widthAnchor.constraint(equalTo: loginBtn.widthAnchor),
            registreerLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

