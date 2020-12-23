//
//  AddCardView.swift
//  iosApps
//
//  Created by Thibo Hoffman on 23/12/2020.
//

import Foundation
import UIKit

class AddCardView: UIView {

    var textField: UITextView!
    var info: UILabel!
    var createBtn: UIButton!

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
        
        info = UILabel()
        info.textColor = UIColor.text()
        info.text = "Names can be inserted by using (name)"
        info.textAlignment = .center
        info.numberOfLines = 2
        info.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        info.translatesAutoresizingMaskIntoConstraints = false
        addSubview(info)
        
        textField = UITextView()
        textField.textColor = UIColor.text()
        textField.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        textField.autocapitalizationType = .sentences
        textField.backgroundColor = UIColor.accentBackground()
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        
        createBtn = UIButton.choiceButton()
        createBtn.setTitle("Create card", for: .normal)
        createBtn.translatesAutoresizingMaskIntoConstraints = false
        addSubview(createBtn)
        
    }
    
    func setUpConstraints() {
  
        NSLayoutConstraint.activate([
            info.centerXAnchor.constraint(equalTo: centerXAnchor),
            info.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            info.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            info.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: centerXAnchor),
            textField.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 20),
            textField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            textField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            createBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            createBtn.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            createBtn.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            createBtn.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
    }
}
