//
//  LoginViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 20/11/2020.
//

import UIKit

class LoginViewController: UIViewController {

    var stackView: UIStackView!
    var usernameTF: UITextField!
    var passwordTF: UITextField!
    var loginBtn: UIButton!
    var regisreerLabel: UILabel!
    
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

        passwordTF = UITextField()
        passwordTF.placeholder = "Password"
        passwordTF.textColor = UIColor.accent()

        
        loginBtn = UIButton.choiceButton()
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginBtn.layer.cornerRadius = 30
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginBtn)

        regisreerLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:21))
        regisreerLabel.text = "Sign up here"
        regisreerLabel.textColor = UIColor.text()
        regisreerLabel.textAlignment = .center
        regisreerLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        regisreerLabel.translatesAutoresizingMaskIntoConstraints = false
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleTap))
        regisreerLabel.isUserInteractionEnabled = true
        regisreerLabel.addGestureRecognizer(gestureRecognizer)
        view.addSubview(regisreerLabel)
        
        stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 30.0
        stackView.axis = .vertical
        stackView.addArrangedSubview(usernameTF)
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
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            loginBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            loginBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            regisreerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            regisreerLabel.widthAnchor.constraint(equalTo: loginBtn.widthAnchor),
            regisreerLabel.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 10)
        ])
    }
    
    @objc func login() {
        print("login")
    }
    
    @IBAction func handleTap(sender:UITapGestureRecognizer) {
        print("register")
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
