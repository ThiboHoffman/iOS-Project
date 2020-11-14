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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        view.backgroundColor = .white
        title = "Add players"

        let playerFieldOne: UITextField = UITextField()
        playerFieldOne.placeholder = "Player 1"
        let playerFieldTwo: UITextField = UITextField()
        playerFieldTwo.placeholder = "Player 2"
        playerFields.append(playerFieldOne)
        playerFields.append(playerFieldTwo)
        
        add = UIButton()
        add.setTitle("+", for: .normal)
        add.setTitleColor(.blue, for: .normal)
        add.layer.borderWidth = 1
        add.layer.borderColor = UIColor.black.cgColor
        add.layer.cornerRadius = 10
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
        
        play = UIButton()
        play.setTitle("Play", for: .normal)
        play.setTitleColor(.blue, for: .normal)
        play.layer.borderWidth = 1
        play.layer.borderColor = UIColor.black.cgColor
        play.layer.cornerRadius = 10
        play.clipsToBounds = true
        play.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        play.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(play)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            add.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            add.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            play.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            play.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
        playerFieldExtra.placeholder = "Player " + String(playerFields.count+1)
        playerFields.append(playerFieldExtra)
        stackView.addArrangedSubview(playerFieldExtra)
    }
    
    @objc func pushNavViewController() {
        
        let newViewController = TypeGameController()
        newViewController.game = createGame()
        navigationController?.pushViewController(newViewController, animated: true)
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
