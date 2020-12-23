//
//  GameViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 09/11/2020.
//

import UIKit
import SwiftyJSON

class GameViewController: UIViewController {

    var gameView = GameView()
    var game: GameModel!
    var cards: [String] = []
    var current: Int = 0
    
    override func viewDidLoad() {
        view = gameView
        setUpView()
    }
    
    func setUpView() {

        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameViewController.handleTap))
        gameView.text.addGestureRecognizer(gestureRecognizer)
        cards = JSONManager.getCardsFromJSON(game: game)
        showCard()
    }
    
    func showCard() {
        gameView.text.text = cards[current]
    }
    
    @IBAction func handleTap(sender:UITapGestureRecognizer) {
        current += 1
        if (current == cards.count-1) {
            endGame()
        }
        showCard()
    }
    
    func endGame() {
        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
            let viewController: TypeGameViewController = navController.viewControllers[navController.viewControllers.count - 2] as! TypeGameViewController
            viewController.viewDidLoad()
        }
        navigationController?.popViewController(animated: true)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
