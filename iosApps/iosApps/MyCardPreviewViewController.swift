//
//  MyCardPreviewViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/11/2020.
//

import UIKit

class MyCardPreviewViewController: UIViewController {

    var card: CardOnline!
    var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.background()
        
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        textLabel = UILabel()
        textLabel.text = card.text.replacingOccurrences(of: "(name)", with: "Bill Gates")
        textLabel.textColor = UIColor.text()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
