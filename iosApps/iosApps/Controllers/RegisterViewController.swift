//
//  RegisterViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 12/12/2020.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var registerView = RegisterView()
    
    override func viewDidLoad() {
        view = registerView

        setUpView()
    }
    
    func setUpView() {
        self.hideKeyboardWhenTappedAround()
        title = "Register"
        
        registerView.registreerBtn.addTarget(self, action: #selector(registreer), for: .touchUpInside)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.handleTap))
        registerView.loginLabel.addGestureRecognizer(gestureRecognizer)
    }

    @objc fileprivate func registreer() {
        
        self.showSpinner(onView: self.view)

        if (registerView.usernameTF.text == "" || registerView.emailTF.text == "" || registerView.passwordTF.text == "" || registerView.passwordConfTF.text == "") {
            self.removeSpinner()
            registerView.errorLabel.isHidden = false
        } else {
            NetworkManager.registreer(username: registerView.usernameTF.text!, email: registerView.emailTF.text!, password: registerView.passwordTF.text!, passwordConfirmation: registerView.passwordConfTF.text!) { loginmodel, error in
                    
                if (!error!) {
                    NetworkManager.getMyCards() { cards in
                        let newViewController = MyCardsViewController()
                        newViewController.myCards = cards
                        self.removeSpinner()
                        self.navigationController?.pushViewController(newViewController, animated: true)
                    }
                } else {
                    self.registerView.errorLabel.isHidden = false
                    self.removeSpinner()
                }
            }
        }
    }
    
    @IBAction func handleTap(sender:UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
}
