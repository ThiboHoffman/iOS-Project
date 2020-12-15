//
//  GameViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 09/11/2020.
//

import UIKit
import SwiftyJSON

class GameViewController: UIViewController {

    var game: GameModel!
    var text: UILabel!
    var cards: [String] = []
    var current: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        view.backgroundColor = UIColor.text()
        
        text = UILabel(frame: CGRect(x:0, y:0, width:200, height:21))
        text.center = CGPoint(x:160, y:284)
        text.textColor = UIColor.accentBackground()
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        text.translatesAutoresizingMaskIntoConstraints = false
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameViewController.handleTap))
        text.isUserInteractionEnabled = true
        text.addGestureRecognizer(gestureRecognizer)
        
        cards = JSONManager.getCardsFromJSON(game: game)
        
        showCard()
        
        view.addSubview(text)
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            text.widthAnchor.constraint(equalTo: view.widthAnchor),
            text.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    func showCard() {
        text.text = cards[current]
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
            let viewController: TypeGameController = navController.viewControllers[navController.viewControllers.count - 2] as! TypeGameController
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
