//
//  PlayerViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 09/11/2020.
//

import UIKit

class PlayerViewController: UIViewController {

    
    var stackView: UIStackView!
    var add: UIButton!
    var play: UIButton!
    var playerFields: [UITextField] = []
    var alert: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        view.backgroundColor = UIColor.background()
        title = "Add players"

        let playerFieldOne: UITextField = UITextField()
        playerFieldOne.placeholder = "Player 1"
        playerFieldOne.textColor = UIColor.text()
        let playerFieldTwo: UITextField = UITextField()
        playerFieldTwo.placeholder = "Player 2"
        playerFieldTwo.textColor = UIColor.text()
        playerFields.append(playerFieldOne)
        playerFields.append(playerFieldTwo)
        
        add = UIButton()
        add.setTitle("+", for: .normal)
        add.setTitleColor(UIColor.accent(), for: .normal)
        add.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        add.layer.borderWidth = 3
        add.layer.borderColor = CGColor.accent()
        add.layer.cornerRadius = 20
        add.clipsToBounds = true
        add.addTarget(self, action: #selector(addPlayerTextField), for: .touchUpInside)
        add.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(add)
        
        stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 8.0
        stackView.axis = .vertical
        stackView.addArrangedSubview(playerFieldOne)
        stackView.addArrangedSubview(playerFieldTwo)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        play = UIButton.choiceButton()
        play.setTitle("Play", for: .normal)
        play.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        play.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(play)
        
        alert = UILabel()
        alert.text = "At least 2 players required!"
        alert.isHidden = true
        alert.textColor = UIColor.text()
        alert.textAlignment = .center
        alert.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        alert.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alert)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            add.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 25),
            add.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            add.widthAnchor.constraint(equalToConstant: 40),
            add.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            play.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            play.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            play.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            play.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        
        NSLayoutConstraint.activate([
            alert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alert.bottomAnchor.constraint(equalTo: play.topAnchor, constant: -10)
        ])
    }
    
    
    func createGame() -> GameModel {
        let game = GameModel()
        for playerField in playerFields {
            if playerField.text != "" {
                game.players.append(playerField.text!)
            }
        }
        return game
    }
    
    @objc func addPlayerTextField() {
        let playerFieldExtra: UITextField = UITextField()
        playerFieldExtra.textColor = UIColor.text()
        playerFieldExtra.placeholder = "Player " + String(playerFields.count+1)
        playerFields.append(playerFieldExtra)
        stackView.addArrangedSubview(playerFieldExtra)
    }
    
    @objc func pushNavViewController() {
        let game: GameModel = createGame()
        if (game.players.count >= 2) {
            let newViewController = TypeGameController()
            newViewController.game = game
            navigationController?.pushViewController(newViewController, animated: true)
        } else {
            alert.isHidden = false
        }
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
