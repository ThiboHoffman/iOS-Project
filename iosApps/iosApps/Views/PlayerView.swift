//
//  PlayerView.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/12/2020.
//

import Foundation
import UIKit

class PlayerView: UIView {
    
    var stackView: UIStackView!
    var add: UIButton!
    var play: UIButton!
    var playerFields: [UITextField] = []
    var alert: UILabel!
    
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

        let playerFieldOne: UITextField = UITextField()
        playerFieldOne.attributedPlaceholder = NSAttributedString(string: "Player 1", attributes: [NSAttributedString.Key.foregroundColor : UIColor.accent()])
        playerFieldOne.textColor = UIColor.text()
        let playerFieldTwo: UITextField = UITextField()
        playerFieldTwo.attributedPlaceholder = NSAttributedString(string: "Player 2", attributes: [NSAttributedString.Key.foregroundColor : UIColor.accent()])
        playerFieldTwo.textColor = UIColor.text()
        playerFields.append(playerFieldOne)
        playerFields.append(playerFieldTwo)
        
        add = UIButton()
        add.setTitle("+", for: .normal)
        add.setTitleColor(UIColor.accent(), for: .normal)
        add.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        add.layer.borderWidth = 3
        add.layer.borderColor = CGColor.accent()
        add.layer.cornerRadius = 20
        add.clipsToBounds = true
        add.addTarget(self, action: #selector(addPlayerTextField), for: .touchUpInside)
        add.translatesAutoresizingMaskIntoConstraints = false
        addSubview(add)
        
        stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 8.0
        stackView.axis = .vertical
        stackView.addArrangedSubview(playerFieldOne)
        stackView.addArrangedSubview(playerFieldTwo)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        play = UIButton.choiceButton()
        play.setTitle("Play", for: .normal)
        play.translatesAutoresizingMaskIntoConstraints = false
        addSubview(play)
        
        alert = UILabel()
        alert.text = "At least 2 players required!"
        alert.isHidden = true
        alert.textColor = UIColor.text()
        alert.textAlignment = .center
        alert.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        alert.translatesAutoresizingMaskIntoConstraints = false
        addSubview(alert)
    }
    
    private var compactConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    private var sharedConstraints: [NSLayoutConstraint] = []
    
    func setUpConstraints() {
        
        sharedConstraints.append(contentsOf: [
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            add.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 25),
            add.centerXAnchor.constraint(equalTo: centerXAnchor),
            add.widthAnchor.constraint(equalToConstant: 40),
            add.heightAnchor.constraint(equalToConstant: 40),
            play.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            play.centerXAnchor.constraint(equalTo: centerXAnchor),
            play.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            play.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            alert.centerXAnchor.constraint(equalTo: centerXAnchor),
            alert.bottomAnchor.constraint(equalTo: play.topAnchor, constant: -10)
        ])

        compactConstraints.append(contentsOf: [
            play.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            play.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])

        regularConstraints.append(contentsOf: [
            play.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            play.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])
        
        layoutTrait(traitCollection: self.traitCollection)
    }
    
    func layoutTrait(traitCollection:UITraitCollection) {
        if (!sharedConstraints[0].isActive) {
           // activating shared constraints
           NSLayoutConstraint.activate(sharedConstraints)
        }
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            if regularConstraints.count > 0 && regularConstraints[0].isActive {
                NSLayoutConstraint.deactivate(regularConstraints)
            }
            // activating compact constraints
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            if compactConstraints.count > 0 && compactConstraints[0].isActive {
                NSLayoutConstraint.deactivate(compactConstraints)
            }
            // activating regular constraints
            NSLayoutConstraint.activate(regularConstraints)
        }
    }
    
    @objc func addPlayerTextField() {
        let playerFieldExtra: UITextField = UITextField()
        playerFieldExtra.textColor = UIColor.text()
        playerFieldExtra.attributedPlaceholder = NSAttributedString(string: "Player " + String(playerFields.count + 1), attributes: [NSAttributedString.Key.foregroundColor : UIColor.accent()])
        playerFields.append(playerFieldExtra)
        stackView.addArrangedSubview(playerFieldExtra)
    }
}
