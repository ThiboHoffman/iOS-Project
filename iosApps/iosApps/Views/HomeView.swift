//
//  HomeView.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/12/2020.
//

//ca-app-pub-3825893118571260~1541488240
//ca-app-pub-3825893118571260/6682134288

import Foundation
import UIKit

class HomeView: UIView {
    
    //var welkomLabel: UILabel!
    var imageView: UIImageView!
    var playButton: UIButton!
    var loginButton: UIButton!
    
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
        addSubview(imageView)
        
        loginButton = UIButton()
        loginButton.setImage(UIImage(named: "profileIcon"), for: .normal)
        loginButton.layer.borderWidth = 3
        loginButton.layer.borderColor = CGColor.accent()
        loginButton.backgroundColor = UIColor.accentBackground()
        loginButton.layer.cornerRadius = 25
        loginButton.clipsToBounds = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loginButton)
        
        playButton = UIButton.choiceButton()
        playButton.setTitle("Play", for: .normal)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(playButton)
    }
    
    func setUpConstraints() {
        /*
        NSLayoutConstraint.activate([
            welkomLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -20),
            welkomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        */
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            playButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            playButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            playButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            loginButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
}
