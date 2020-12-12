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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        view.backgroundColor = UIColor.background()
        
        usernameTF = UITextField()
        usernameTF.placeholder = "Username"
        usernameTF.textColor = UIColor.accent()
        
        emailTF = UITextField()
        emailTF.placeholder = "Email"
        emailTF.textColor = UIColor.accent()

        passwordTF = UITextField()
        passwordTF.placeholder = "Password"
        passwordTF.isSecureTextEntry = true
        passwordTF.textContentType = .oneTimeCode
        passwordTF.textColor = UIColor.accent()

        passwordConfTF = UITextField()
        passwordConfTF.placeholder = "Password Confirmation"
        passwordConfTF.isSecureTextEntry = true
        passwordConfTF.textContentType = .oneTimeCode
        passwordConfTF.textColor = UIColor.accent()
        
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
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            registreerBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registreerBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            registreerBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            registreerBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.widthAnchor.constraint(equalTo: registreerBtn.widthAnchor),
            loginLabel.topAnchor.constraint(equalTo: registreerBtn.bottomAnchor, constant: 10)
        ])
    }
    
    @objc fileprivate func registreer() {
        
        self.showSpinner(onView: self.view)

        do {
            NetworkManager.registreer(username: usernameTF.text!, email: emailTF.text!, password: passwordTF.text!, passwordConfirmation: passwordConfTF.text!) { loginmodel in
                print("ingelogd")
                NetworkManager.getMyCards() { cards in
                    let newViewController = MyCardsViewController()
                    newViewController.myCards = cards
                    self.removeSpinner()
                    self.navigationController?.pushViewController(newViewController, animated: true)
                }
            }
        } catch {
            print("fout")
        }
    }
    
    @IBAction func handleTap(sender:UITapGestureRecognizer) {
        let newViewController = LoginViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

}
