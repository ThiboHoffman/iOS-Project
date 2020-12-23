//
//  PlayerViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 09/11/2020.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var playerView = PlayerView()
    
    override func viewDidLoad() {
        view = playerView
        
        setUpView()
    }
    
    func setUpView() {
        title = "Add players"
        playerView.play.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        self.hideKeyboardWhenTappedAround()
    }
    
    func createGame() -> GameModel {
        let game = GameModel()
        for playerField in playerView.playerFields {
            if playerField.text != "" {
                game.players.append(playerField.text!)
            }
        }
        return game
    }
    
    @objc func pushNavViewController() {
        let game: GameModel = createGame()
        if (game.players.count >= 2) {
            let newViewController = TypeGameViewController()
            newViewController.game = game
            navigationController?.pushViewController(newViewController, animated: true)
        } else {
            playerView.alert.isHidden = false
        }
    }
}
