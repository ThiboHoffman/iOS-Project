//
//  AddCardViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/11/2020.
//

import UIKit

class AddCardViewController: UIViewController {

    var textField: UITextView!
    var info: UILabel!
    var createBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        title = "Add card"
        view.backgroundColor = UIColor.background()
        
        info = UILabel()
        info.textColor = UIColor.text()
        info.text = "Names can be inserted by using (name)"
        info.textAlignment = .center
        info.numberOfLines = 2
        info.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        info.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(info)
        
        textField = UITextView()
        textField.textColor = UIColor.accent()
        textField.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        textField.autocapitalizationType = .sentences
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        createBtn = UIButton.choiceButton()
        createBtn.setTitle("Create card", for: .normal)
        createBtn.addTarget(self, action: #selector(createCard), for: .touchUpInside)
        createBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createBtn)
        
    }
    
    func setUpConstraints() {
  
        NSLayoutConstraint.activate([
            info.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            info.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            info.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            info.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 20),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            textField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            createBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            createBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            createBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
    }
    
    @objc func createCard() {
        NetworkManager.makeCard(text: textField.text, gebruikerID: 1) { card in
            if let navController = self.navigationController, navController.viewControllers.count >= 2 {
                let viewController: MyCardsViewController = navController.viewControllers[navController.viewControllers.count - 2] as! MyCardsViewController
                viewController.myCards.append(card)
                viewController.viewDidLoad()
            }
            self.navigationController?.popViewController(animated: true)
        }
    }

}
