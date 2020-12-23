//
//  TypeGameView.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/12/2020.
//

import Foundation
import UIKit

class TypeGameView: UIView {
    
    //var game: GameModel
    var stackView: UIStackView!
    var casualBtn: UIButton!
    var wildBtn: UIButton!
    var onlineBtn: UIButton!
    
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
        backgroundColor = .white
        casualBtn = UIButton.choiceButton()
        casualBtn.setTitle("Casual", for: .normal)
        casualBtn.clipsToBounds = true
        casualBtn.translatesAutoresizingMaskIntoConstraints = false
        
        wildBtn = UIButton.choiceButton()
        wildBtn.setTitle("Wild", for: .normal)
        wildBtn.clipsToBounds = true
        wildBtn.translatesAutoresizingMaskIntoConstraints = false
        
        onlineBtn = UIButton.choiceButton()
        onlineBtn.setTitle("Online", for: .normal)
        onlineBtn.clipsToBounds = true
        onlineBtn.translatesAutoresizingMaskIntoConstraints = false
        
        stackView = UIStackView()
        stackView.alignment = .fill
        stackView.spacing = 8.0
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(casualBtn)
        stackView.addArrangedSubview(wildBtn)
        stackView.addArrangedSubview(onlineBtn)
        addSubview(stackView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
    }
}
