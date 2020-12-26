//
//  OnlineSearchViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/11/2020.
//

import UIKit

class OnlineSearchViewController: UIViewController {
    
    var game: GameModel!
    var onlineSearchView = OnlineSearchView()

    override func viewDidLoad() {
        view = onlineSearchView
        setUpView()
    }
    
    func setUpView() {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        onlineSearchView.startGameBtn.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
    }
    
    @objc func pushNavViewController() {
        
        self.showSpinner(onView: self.view)

        var min: Int = 0
        switch onlineSearchView.segmentMin.selectedSegmentIndex {
            case 0: min = 0
            case 1: min = 25
            case 2: min = 50
            case 3: min = 75
            default: min = 0
        }
        
        var max: Int = 0
        switch onlineSearchView.segmentMax.selectedSegmentIndex {
            case 0: max = 25
            case 1: max = 50
            case 2: max = 75
            case 3: max = 100
            default: max = 100
        }
        
        NetworkManager.getCards(min: min, max: max) { cards in
            self.removeSpinner()

            let newViewController = OnlineGameViewController()
            newViewController.cards = cards
            newViewController.game = self.game
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
