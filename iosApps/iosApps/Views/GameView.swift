//
//  GameView.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/12/2020.
//

import Foundation
import UIKit

class GameView: UIView {
    
    var text: UILabel!
    
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
        text.textColor = UIColor.accentBackground()
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        text.isUserInteractionEnabled = true
        text.translatesAutoresizingMaskIntoConstraints = false

        addSubview(text)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: centerXAnchor),
            text.centerYAnchor.constraint(equalTo: centerYAnchor),
            text.widthAnchor.constraint(equalTo: widthAnchor),
            text.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}
