//
//  MyCardPreviewView.swift
//  iosApps
//
//  Created by Thibo Hoffman on 23/12/2020.
//

import Foundation
import UIKit

class MyCardPreviewView: UIView {

    var textLabel: UILabel!

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

        textLabel = UILabel()
        textLabel.textColor = UIColor.text()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
