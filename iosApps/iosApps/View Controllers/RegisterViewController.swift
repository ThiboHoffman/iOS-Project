//
//  RegisterViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 12/12/2020.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var stackView: UIStackView!
    var usernameTF: UITextField!
    var emailTF: UITextField!
    var passwordTF: UITextField!
    var passwordConfTF: UITextField!
    var registreerBtn: UIButton!
    var loginLabel: UILabel!
    var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        view.backgroundColor = UIColor.background()
        title = "Register"
        
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
        registreerBtn.addTarget(self, action: #selector(registreer), for: .touchUpInside)
        registreerBtn.layer.cornerRadius = 30
        registreerBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(registreerBtn)

        loginLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:21))
        loginLabel.text = "Or log in here"
        loginLabel.textColor = UIColor.text()
        loginLabel.textAlignment = .center
        loginLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleTap))
        loginLabel.isUserInteractionEnabled = true
        loginLabel.addGestureRecognizer(gestureRecognizer)
        view.addSubview(loginLabel)
        
        stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 30.0
        stackView.axis = .vertical
        stackView.addArrangedSubview(usernameTF)
        stackView.addArrangedSubview(emailTF)
        stackView.addArrangedSubview(passwordTF)
        stackView.addArrangedSubview(passwordConfTF)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        errorLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:21))
        errorLabel.text = "Entered credentials incorrent. Try again."
        errorLabel.textColor = UIColor.text()
        errorLabel.textAlignment = .center
        errorLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.isHidden = true
        view.addSubview(errorLabel)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.widthAnchor.constraint(equalTo: registreerBtn.widthAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: registreerBtn.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            registreerBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registreerBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            registreerBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            registreerBtn.bottomAnchor.constraint(equalTo: loginLabel.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.widthAnchor.constraint(equalTo: registreerBtn.widthAnchor),
            loginLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc fileprivate func registreer() {
        
        self.showSpinner(onView: self.view)

        if (usernameTF.text == "" || emailTF.text == "" || passwordTF.text == "" || passwordConfTF.text == "") {
            self.removeSpinner()
            errorLabel.isHidden = false
        } else {
            NetworkManager.registreer(username: usernameTF.text!, email: emailTF.text!, password: passwordTF.text!, passwordConfirmation: passwordConfTF.text!) { loginmodel in
                print("ingelogd")
                NetworkManager.getMyCards() { cards in
                    let newViewController = MyCardsViewController()
                    newViewController.myCards = cards
                    self.removeSpinner()
                    self.navigationController?.pushViewController(newViewController, animated: true)
                }
            }
        }
    }
    
    @IBAction func handleTap(sender:UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }

}
