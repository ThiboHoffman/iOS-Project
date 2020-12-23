//
//  TypeGameController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 09/11/2020.
//

import UIKit

class TypeGameViewController: UIViewController {
    
    var game: GameModel!
    var typeGameView = TypeGameView()
    
    override func viewDidLoad() {
        view = typeGameView

        setUpView()
    }
    
    func setUpView() {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        title = "Choose game type"
        typeGameView.casualBtn.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        typeGameView.wildBtn.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        typeGameView.onlineBtn.addTarget(self, action: #selector(pushOnlineViewController), for: .touchUpInside)
    }
    
    @objc func pushNavViewController(sender: UIButton) {
        let newViewController = GameViewController()
        game.type = sender.currentTitle!
        newViewController.game = game
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func pushOnlineViewController(sender: UIButton) {
        if NetworkManager.Connectivity.isConnectedToInternet {
            let newViewController = OnlineSearchViewController()
            newViewController.game = self.game
            self.navigationController?.pushViewController(newViewController, animated: true)
         } else {
            let alert = UIAlertController(title: "You are not connected to the internet.", message: "Please connect to internet to play the online game.", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            
            self.present(alert, animated: true)
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
