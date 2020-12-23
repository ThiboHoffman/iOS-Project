//
//  LoginViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 20/11/2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView = LoginView()

    override func viewDidLoad() {
        view = loginView

        setUpView()
    }
    
    func setUpView() {
        self.hideKeyboardWhenTappedAround()
        title = "Login"

        loginView.loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        loginView.registreerLabel.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func login(sender:UITapGestureRecognizer) {
        
        self.showSpinner(onView: self.view)

        if (loginView.emailTF.text == "" || loginView.passwordTF.text == "") {
            self.removeSpinner()
            loginView.errorLabel.isHidden = false
        } else {
            NetworkManager.login(email: loginView.emailTF.text!, password: loginView.passwordTF.text!) { loginmodel in
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
}
