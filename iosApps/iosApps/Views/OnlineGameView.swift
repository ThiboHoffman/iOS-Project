//
//  OnlineGameView.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/12/2020.
//

import Foundation
import UIKit

class OnlineGameView: UIView {
    
    var text: UILabel!
    var buttonStack: UIStackView!
    var likeBtn: UIButton!
    var dislikeBtn: UIButton!
    var reportBtn: UIButton!
    
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
        
        backgroundColor = UIColor.text()
        
        text = UILabel(frame: CGRect(x:0, y:0, width:200, height:21))
        text.center = CGPoint(x:160, y:284)
        text.textColor = UIColor.background()
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        text.isUserInteractionEnabled = true
        text.translatesAutoresizingMaskIntoConstraints = false
        
        likeBtn = UIButton()
        likeBtn.setImage(UIImage(named: "likeIcon"), for: .normal)
        likeBtn.contentHorizontalAlignment = .fill
        likeBtn.imageView?.contentMode = .scaleAspectFit
        likeBtn.alpha = 0.5
        likeBtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        likeBtn.translatesAutoresizingMaskIntoConstraints = false
        
        dislikeBtn = UIButton()
        dislikeBtn.setImage(UIImage(named: "dislikeIcon"), for: .normal)
        dislikeBtn.contentHorizontalAlignment = .fill
        dislikeBtn.imageView?.contentMode = .scaleAspectFit
        dislikeBtn.alpha = 0.5
        dislikeBtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        dislikeBtn.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStack = UIStackView()
        buttonStack.alignment = .center
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 0
        buttonStack.axis = .vertical
        buttonStack.addArrangedSubview(likeBtn)
        buttonStack.addArrangedSubview(dislikeBtn)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonStack)
        
        reportBtn = UIButton()
        reportBtn.setImage(UIImage(named: "reportIcon"), for: .normal)
        reportBtn.setTitleColor(.blue, for: .normal)
        reportBtn.layer.borderWidth = 3
        reportBtn.layer.borderColor = CGColor.accentBackground()
        reportBtn.layer.cornerRadius = 20
        reportBtn.alpha = 0.5
        reportBtn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        reportBtn.clipsToBounds = true
        reportBtn.translatesAutoresizingMaskIntoConstraints = false
        addSubview(reportBtn)
        
        addSubview(text)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: centerXAnchor),
            text.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            buttonStack.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
            buttonStack.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.25)
        ])
        
        NSLayoutConstraint.activate([
            reportBtn.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            reportBtn.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            reportBtn.heightAnchor.constraint(equalToConstant: 40),
            reportBtn.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}
