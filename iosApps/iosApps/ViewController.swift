//
//  ViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 07/11/2020.
//

import UIKit

class ViewController: UIViewController {

    var welkomLabel: UILabel!
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
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.accent()]
        navigationController?.navigationBar.tintColor = UIColor.accent()
        
        welkomLabel = UILabel()
        welkomLabel.text = "Welkom!"
        welkomLabel.textColor = UIColor.text()
        welkomLabel.textAlignment = .center
        welkomLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        welkomLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welkomLabel)
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "bierImage")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        loginButton = UIButton()
        loginButton.setImage(UIImage(named: "profileIcon"), for: .normal)
        loginButton.layer.borderWidth = 3
        loginButton.layer.borderColor = CGColor.accentBackground()
        loginButton.backgroundColor = UIColor.background()
        loginButton.layer.cornerRadius = 25
        loginButton.clipsToBounds = true
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        
        playButton = UIButton.choiceButton()
        playButton.setTitle("Play!", for: .normal)
        playButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playButton)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            welkomLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -20),
            welkomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
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
        let newViewController = LoginViewController()
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func pushNavViewController() {
        let newViewController = PlayerViewController()
        navigationController?.pushViewController(newViewController, animated: true)
    }
}

