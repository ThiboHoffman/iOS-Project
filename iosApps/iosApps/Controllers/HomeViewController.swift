//
//  ViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 07/11/2020.
//

import UIKit

class HomeViewController: UIViewController {

    var homeView =  HomeView()
    
    override func viewDidLoad() {
        view = homeView
        
        setUpView()
    }
    
    func setUpView() {
        navigationController?.navigationBar.barTintColor = UIColor.accentBackground()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.text()]
        navigationController?.navigationBar.tintColor = UIColor.text()
        
        let defaults = UserDefaults.standard
        if (defaults.object(forKey: "token") as? String) != nil {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutTapped))
        }
        
        homeView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        homeView.playButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
    }

    @objc func login() {
            
        if NetworkManager.Connectivity.isConnectedToInternet {
            let defaults = UserDefaults.standard

            if (defaults.object(forKey: "token") as? String) != nil {
                NetworkManager.getMyCards() { cards in
                    let newViewController = MyCardsViewController()
                    newViewController.myCards = cards
                    self.removeSpinner()
                    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(self.logoutTapped))
                    self.navigationController?.pushViewController(newViewController, animated: true)
                }
            } else {
                let newViewController = LoginViewController()
                navigationController?.pushViewController(newViewController, animated: true)
            }
         } else {
            let alert = UIAlertController(title: "You are not connected to the internet.", message: "Please connect to internet to play the online game.", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            
            self.present(alert, animated: true)
        }
        
    }
    
    @objc func logoutTapped() {
        let alert = UIAlertController(title: "Are you sure you want to log out?", message: "", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            let defaults = UserDefaults.standard
            defaults.removeObject(forKey: "token")
            defaults.removeObject(forKey: "gebruikerID")
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: #selector(self.logoutTapped))
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
            print("cancelled")
        }))

        self.present(alert, animated: true)
    }
    
    @objc func pushNavViewController() {
        let newViewController = PlayerViewController()
        navigationController?.pushViewController(newViewController, animated: true)
    }
}
