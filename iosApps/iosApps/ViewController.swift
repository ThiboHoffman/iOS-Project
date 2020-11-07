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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //alle setup
        view.backgroundColor = .white
        
        setUpView()
        setupConstraints()
    }
    
    func setUpView() {
     
        welkomLabel = UILabel()
        welkomLabel.text = "Welkom!"
        //UIColor.black
        welkomLabel.textColor = .black
        //UIAlignment.center
        welkomLabel.textAlignment = .center
        welkomLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        welkomLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welkomLabel)
        
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "bierImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        playButton = UIButton()
        playButton.setTitle("Play!", for: .normal)
        playButton.setTitleColor(.blue, for: .normal)
        playButton.layer.borderWidth = 1
        //cgColor voor layers
        playButton.layer.borderColor = UIColor.black.cgColor
        playButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playButton)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            welkomLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            welkomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: welkomLabel.bottomAnchor, constant: 15),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            playButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 40),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}

