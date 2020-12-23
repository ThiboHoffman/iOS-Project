//
//  OnlineGameViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 16/11/2020.
//

import UIKit

class OnlineGameViewController: UIViewController {

    var cards: [CardOnline]!
    var game: GameModel!
    var current: Int = 0
    var onlineGameView = OnlineGameView()
    
    override func viewDidLoad() {
        view = onlineGameView
        setUpView()
    }
    
    func setUpView() {
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        onlineGameView.likeBtn.addTarget(self, action: #selector(like), for: .touchUpInside)
        onlineGameView.dislikeBtn.addTarget(self, action: #selector(dislike), for: .touchUpInside)
        onlineGameView.reportBtn.addTarget(self, action: #selector(report), for: .touchUpInside)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(OnlineGameViewController.handleTap))
        onlineGameView.text.addGestureRecognizer(gestureRecognizer)

        self.showCard()
    }
    
    @objc func showCard() {
        let textString = cards[current].text.replacingOccurrences(of: "(name)", with: String(game.players[Int.random(in: 0...(game.players.count-1))]))
        onlineGameView.text.text = textString
    }
    
    @objc func like() {
        NetworkManager.likeCard(id: cards[current].cardID)
        nextCard()
    }
    
    @objc func dislike() {
        NetworkManager.dislikeCard(id: cards[current].cardID)
        nextCard()
    }
    
    @objc func report() {
        let alert = UIAlertController(title: "Are you sure you cant to report this card?", message: "Only report cards when they break the rules", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            NetworkManager.reportCard(id: self.cards[self.current].cardID)
            self.nextCard()
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
            print("not reported")
        }))

        self.present(alert, animated: true)
    }
    
    @IBAction func handleTap(sender:UITapGestureRecognizer) {
        nextCard()
    }
    
    func nextCard() {
        current += 1
        if (current == cards.count-1) {
            endGame()
        }
        showCard()
    }
    
    func endGame() {
        if let navController = self.navigationController, navController.viewControllers.count >= 2 {
            let viewController: OnlineSearchViewController = navController.viewControllers[navController.viewControllers.count - 2] as! OnlineSearchViewController
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
