//
//  AddCardViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/11/2020.
//

import UIKit

class AddCardViewController: UIViewController {
    
    var addCardView = AddCardView()
    
    override func viewDidLoad() {
        view = addCardView
        
        setUpView()
    }
    
    func setUpView() {
        title = "Add card"
        self.hideKeyboardWhenTappedAround()
        addCardView.createBtn.addTarget(self, action: #selector(createCard), for: .touchUpInside)
    }
    
    @objc func createCard() {
        NetworkManager.makeCard(text: addCardView.textField.text) { card in
            if let navController = self.navigationController, navController.viewControllers.count >= 2 {
                let viewController: MyCardsViewController = navController.viewControllers[navController.viewControllers.count - 2] as! MyCardsViewController
                viewController.myCards.append(card)
                viewController.viewDidLoad()
            }
            self.navigationController?.popViewController(animated: true)
        }
    }

}
