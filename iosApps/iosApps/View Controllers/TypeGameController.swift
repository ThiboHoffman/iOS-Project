//
//  TypeGameController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 09/11/2020.
//

import UIKit

class TypeGameController: UIViewController {

    //var game: GameModel
    var stackView: UIStackView!
    var casualBtn: UIButton!
    var wildBtn: UIButton!
    var onlineBtn: UIButton!
    var game: GameModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        setUpView()
        setUpContraints()
    }
    
    
    func setUpView() {
        
        print(game.players)
        
        view.backgroundColor = .white
        title = "Choose game type"
        casualBtn = UIButton.choiceButton()
        casualBtn.setTitle("Casual", for: .normal)
        casualBtn.clipsToBounds = true
        casualBtn.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        casualBtn.translatesAutoresizingMaskIntoConstraints = false
        
        wildBtn = UIButton.choiceButton()
        wildBtn.setTitle("Wild", for: .normal)
        wildBtn.clipsToBounds = true
        wildBtn.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        wildBtn.translatesAutoresizingMaskIntoConstraints = false
        
        onlineBtn = UIButton.choiceButton()
        onlineBtn.setTitle("Online", for: .normal)
        onlineBtn.clipsToBounds = true
        onlineBtn.addTarget(self, action: #selector(pushOnlineViewController), for: .touchUpInside)
        onlineBtn.translatesAutoresizingMaskIntoConstraints = false
        
        stackView = UIStackView()
        stackView.alignment = .fill
        stackView.spacing = 8.0
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(casualBtn)
        stackView.addArrangedSubview(wildBtn)
        stackView.addArrangedSubview(onlineBtn)
        view.addSubview(stackView)
    }
    
    func setUpContraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
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
