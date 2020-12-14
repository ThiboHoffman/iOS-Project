//
//  LoginViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 20/11/2020.
//

import UIKit

class LoginViewController: UIViewController {

    var stackView: UIStackView!
    var emailTF: UITextField!
    var passwordTF: UITextField!
    var loginBtn: UIButton!
    var registreerLabel: UILabel!
    
    var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        title = "Login"
        view.backgroundColor = UIColor.background()
        
        emailTF = UITextField()
        emailTF.placeholder = "Email"
        emailTF.textColor = UIColor.text()

        passwordTF = UITextField()
        passwordTF.placeholder = "Password"
        passwordTF.isSecureTextEntry = true
        passwordTF.textColor = UIColor.text()

        
        loginBtn = UIButton.choiceButton()
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginBtn.layer.cornerRadius = 30
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginBtn)

        errorLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:21))
        errorLabel.text = "Entered credentials incorrent. Try again."
        errorLabel.textColor = UIColor.text()
        errorLabel.textAlignment = .center
        errorLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.isHidden = true
        view.addSubview(errorLabel)
        
        registreerLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:21))
        registreerLabel.text = "Sign up here"
        registreerLabel.textColor = UIColor.text()
        registreerLabel.textAlignment = .center
        registreerLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        registreerLabel.translatesAutoresizingMaskIntoConstraints = false
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleTap))
        registreerLabel.isUserInteractionEnabled = true
        registreerLabel.addGestureRecognizer(gestureRecognizer)
        view.addSubview(registreerLabel)
        
        stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 30.0
        stackView.axis = .vertical
        stackView.addArrangedSubview(emailTF)
        stackView.addArrangedSubview(passwordTF)
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
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.widthAnchor.constraint(equalTo: loginBtn.widthAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: loginBtn.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            loginBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            loginBtn.bottomAnchor.constraint(equalTo: registreerLabel.topAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            registreerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registreerLabel.widthAnchor.constraint(equalTo: loginBtn.widthAnchor),
            registreerLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc fileprivate func login() {
        
        self.showSpinner(onView: self.view)

        if (emailTF.text == "" || passwordTF.text == "") {
            self.removeSpinner()
            errorLabel.isHidden = false
        } else {
            NetworkManager.login(email: emailTF.text!, password: passwordTF.text!) { loginmodel in
                    print("ingelogd")
                    self.showSpinner(onView: self.view)

                    NetworkManager.getMyCards() { cards in
                        let newViewController = MyCardsViewController()
                        newViewController.myCards = cards
                        self.removeSpinner()
                        self.navigationController?.pushViewController(newViewController, animated: true)
                    }
                    return
            }
        }
    }
    
    @IBAction func handleTap(sender:UITapGestureRecognizer) {
        let newViewController = RegisterViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
