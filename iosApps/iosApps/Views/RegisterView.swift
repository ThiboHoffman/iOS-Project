//
//  RegisterView.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/12/2020.
//

import Foundation
import UIKit

class RegisterView: UIView {
    
    var stackView: UIStackView!
    var usernameTF: UITextField!
    var emailTF: UITextField!
    var passwordTF: UITextField!
    var passwordConfTF: UITextField!
    var registreerBtn: UIButton!
    var loginLabel: UILabel!
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
        
        usernameTF = UITextField()
        usernameTF.placeholder = "Username"
        usernameTF.textContentType = .oneTimeCode
        usernameTF.textColor = UIColor.text()
        
        emailTF = UITextField()
        emailTF.placeholder = "Email"
        emailTF.textContentType = .oneTimeCode
        emailTF.textColor = UIColor.text()

        passwordTF = UITextField()
        passwordTF.placeholder = "Password"
        passwordTF.isSecureTextEntry = true
        passwordTF.textContentType = .oneTimeCode
        passwordTF.textColor = UIColor.text()

        passwordConfTF = UITextField()
        passwordConfTF.placeholder = "Password Confirmation"
        passwordConfTF.isSecureTextEntry = true
        passwordConfTF.textContentType = .oneTimeCode
        passwordConfTF.textAlignment = .center
        passwordConfTF.textColor = UIColor.text()
        
        registreerBtn = UIButton.choiceButton()
        registreerBtn.setTitle("Registreer", for: .normal)
        registreerBtn.layer.cornerRadius = 30
        registreerBtn.translatesAutoresizingMaskIntoConstraints = false
        addSubview(registreerBtn)

        loginLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:21))
        loginLabel.text = "Or log in here"
        loginLabel.textColor = UIColor.text()
        loginLabel.textAlignment = .center
        loginLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        loginLabel.isUserInteractionEnabled = true
        loginLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(loginLabel)
        
        stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 30.0
        stackView.axis = .vertical
        stackView.addArrangedSubview(usernameTF)
        stackView.addArrangedSubview(emailTF)
        stackView.addArrangedSubview(passwordTF)
        stackView.addArrangedSubview(passwordConfTF)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        errorLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:21))
        errorLabel.text = "Entered credentials incorrent. Try again."
        errorLabel.textColor = UIColor.text()
        errorLabel.textAlignment = .center
        errorLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.isHidden = true
        addSubview(errorLabel)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            errorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            errorLabel.widthAnchor.constraint(equalTo: registreerBtn.widthAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: registreerBtn.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            registreerBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            registreerBtn.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            registreerBtn.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            registreerBtn.bottomAnchor.constraint(equalTo: loginLabel.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginLabel.widthAnchor.constraint(equalTo: registreerBtn.widthAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
