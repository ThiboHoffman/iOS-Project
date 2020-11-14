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
        casualBtn = UIButton()
        casualBtn.setTitle("Casual", for: .normal)
        casualBtn.setTitleColor(.blue, for: .normal)
        casualBtn.layer.borderWidth = 1
        casualBtn.layer.borderColor = UIColor.black.cgColor
        casualBtn.layer.cornerRadius = 10
        casualBtn.clipsToBounds = true
        casualBtn.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        casualBtn.translatesAutoresizingMaskIntoConstraints = false
        
        wildBtn = UIButton()
        wildBtn.setTitle("Wild", for: .normal)
        wildBtn.setTitleColor(.blue, for: .normal)
        wildBtn.layer.borderWidth = 1
        wildBtn.layer.borderColor = UIColor.black.cgColor
        wildBtn.layer.cornerRadius = 10
        wildBtn.clipsToBounds = true
        wildBtn.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        wildBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
        stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 8.0
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(casualBtn)
        stackView.addArrangedSubview(wildBtn)
        view.addSubview(stackView)
    }
    
    func setUpContraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
        
    }
    
    @objc func pushNavViewController(sender: UIButton) {
        let newViewController = GameViewController()
        game.type = sender.currentTitle!
        newViewController.game = game
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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
