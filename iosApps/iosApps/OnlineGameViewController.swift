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
    var text: UILabel!
    var buttonStack: UIStackView!
    var likeBtn: UIButton!
    var dislikeBtn: UIButton!
    var reportBtn: UIButton!
    var current: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        view.backgroundColor = .white
        
        text = UILabel(frame: CGRect(x:0, y:0, width:200, height:21))
        text.center = CGPoint(x:160, y:284)
        text.textColor = .black
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        text.translatesAutoresizingMaskIntoConstraints = false
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(OnlineGameViewController.handleTap))
        text.isUserInteractionEnabled = true
        text.addGestureRecognizer(gestureRecognizer)
        
        likeBtn = UIButton()
        likeBtn.setImage(UIImage(named: "likeIcon"), for: .normal)
        likeBtn.addTarget(self, action: #selector(like), for: .touchUpInside)
        likeBtn.contentVerticalAlignment = .fill
        likeBtn.contentHorizontalAlignment = .fill
        likeBtn.alpha = 0.5
        likeBtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        likeBtn.translatesAutoresizingMaskIntoConstraints = false
        
        dislikeBtn = UIButton()
        dislikeBtn.setImage(UIImage(named: "dislikeIcon"), for: .normal)
        dislikeBtn.addTarget(self, action: #selector(dislike), for: .touchUpInside)
        dislikeBtn.contentVerticalAlignment = .fill
        dislikeBtn.contentHorizontalAlignment = .fill
        dislikeBtn.alpha = 0.5
        dislikeBtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        dislikeBtn.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStack = UIStackView()
        buttonStack.alignment = .center
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 0
        buttonStack.axis = .vertical
        buttonStack.addArrangedSubview(likeBtn)
        buttonStack.addArrangedSubview(dislikeBtn)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStack)
        
        reportBtn = UIButton()
        reportBtn.setImage(UIImage(named: "reportIcon"), for: .normal)
        reportBtn.setTitleColor(.blue, for: .normal)
        reportBtn.layer.borderWidth = 3
        reportBtn.layer.borderColor = CGColor.accentBackground()
        reportBtn.layer.cornerRadius = 20
        reportBtn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        reportBtn.clipsToBounds = true
        reportBtn.addTarget(self, action: #selector(report), for: .touchUpInside)
        reportBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reportBtn)
        
        self.showCard()
        view.addSubview(text)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            buttonStack.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            buttonStack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25)
        ])
        
        NSLayoutConstraint.activate([
            reportBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            reportBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            reportBtn.heightAnchor.constraint(equalToConstant: 40),
            reportBtn.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func showCard() {
        let textString = cards[current].text.replacingOccurrences(of: "(name)", with: String(game.players[Int.random(in: 0...(game.players.count-1))]))
        text.text = textString
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
