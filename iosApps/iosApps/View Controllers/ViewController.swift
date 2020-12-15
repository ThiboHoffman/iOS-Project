//
//  ViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 07/11/2020.
//

import UIKit

class ViewController: UIViewController {

    //var welkomLabel: UILabel!
    var imageView: UIImageView!
    var playButton: UIButton!
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setupConstraints()
    }
    
    func setUpView() {
     
        view.backgroundColor = UIColor.background()
        navigationController?.navigationBar.barTintColor = UIColor.accentBackground()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.text()]
        navigationController?.navigationBar.tintColor = UIColor.text()
        
        let defaults = UserDefaults.standard
        if let token = defaults.object(forKey: "token") as? String {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutTapped))
        }
        /*
        welkomLabel = UILabel()
        welkomLabel.text = "Welkom!"
        welkomLabel.textColor = UIColor.text()
        welkomLabel.textAlignment = .center
        welkomLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        welkomLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welkomLabel)
        */
        imageView = UIImageView()
        imageView.image = UIImage(named: "bierImage")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        loginButton = UIButton()
        loginButton.setImage(UIImage(named: "profileIcon"), for: .normal)
        loginButton.layer.borderWidth = 3
        loginButton.layer.borderColor = CGColor.accent()
        loginButton.backgroundColor = UIColor.accentBackground()
        loginButton.layer.cornerRadius = 25
        loginButton.clipsToBounds = true
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        playButton = UIButton.choiceButton()
        playButton.setTitle("Play", for: .normal)
        playButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playButton)
    }
    
    func setupConstraints() {
        /*
        NSLayoutConstraint.activate([
            welkomLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -20),
            welkomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        */
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            playButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            playButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            loginButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc func login() {
        
        if NetworkManager.Connectivity.isConnectedToInternet {
            let defaults = UserDefaults.standard

            if let token = defaults.object(forKey: "token") as? String {
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
