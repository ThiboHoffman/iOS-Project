//
//  OnlineSearchViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/11/2020.
//

import UIKit

class OnlineSearchViewController: UIViewController {

    var minLabel: UILabel!
    var segmentMin: UISegmentedControl!
    var maxLabel: UILabel!
    var segmentMax: UISegmentedControl!
    var startGameBtn: UIButton!
    
    var game: GameModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        setUpView()
        setUpConstraints()
    }
        

    func setUpView() {
        
        minLabel = UILabel()
        minLabel.text = "Minumum like percentage"
        minLabel.textColor = UIColor.text()
        minLabel.textAlignment = .center
        minLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        minLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(minLabel)
        
        view.backgroundColor = UIColor.background()
        segmentMin = UISegmentedControl()
        segmentMin.insertSegment(withTitle: "0", at: 0, animated: true)
        segmentMin.insertSegment(withTitle: "25", at: 1, animated: true)
        segmentMin.insertSegment(withTitle: "50", at: 2, animated: true)
        segmentMin.insertSegment(withTitle: "75", at: 3, animated: true)
        segmentMin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentMin)
        
        maxLabel = UILabel()
        maxLabel.text = "Maximum like percentage"
        maxLabel.textColor = UIColor.text()
        maxLabel.textAlignment = .center
        maxLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        maxLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(maxLabel)
        
        segmentMax = UISegmentedControl()
        segmentMax.insertSegment(withTitle: "25", at: 0, animated: true)
        segmentMax.insertSegment(withTitle: "50", at: 1, animated: true)
        segmentMax.insertSegment(withTitle: "75", at: 2, animated: true)
        segmentMax.insertSegment(withTitle: "100", at: 3, animated: true)
        segmentMax.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentMax)
        
        startGameBtn = UIButton.choiceButton()
        startGameBtn.setTitle("Start game", for: .normal)
        startGameBtn.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        startGameBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startGameBtn)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            minLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            minLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200)
        ])
        NSLayoutConstraint.activate([
            segmentMin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentMin.topAnchor.constraint(equalTo: minLabel.bottomAnchor, constant: 20),
            segmentMin.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        NSLayoutConstraint.activate([
            maxLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            maxLabel.topAnchor.constraint(equalTo: segmentMin.bottomAnchor, constant: 30),
            maxLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        NSLayoutConstraint.activate([
            segmentMax.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentMax.topAnchor.constraint(equalTo: maxLabel.bottomAnchor, constant: 20),
            segmentMax.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        NSLayoutConstraint.activate([
            startGameBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startGameBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            startGameBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            startGameBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
    }
    
    @objc func pushNavViewController() {
        
        self.showSpinner(onView: self.view)

        var min: Int = 0
        switch segmentMin.selectedSegmentIndex {
            case 0: min = 0
            case 1: min = 25
            case 2: min = 50
            case 3: min = 75
            default: min = 0
        }
        
        var max: Int = 0
        switch segmentMax.selectedSegmentIndex {
            case 0: max = 25
            case 1: max = 50
            case 2: max = 75
            case 3: max = 100
            default: max = 0
        }
        
        NetworkManager.getCards(min: min, max: max) { cards in
            self.removeSpinner()

            let newViewController = OnlineGameViewController()
            newViewController.cards = cards
            newViewController.game = self.game
            self.navigationController?.pushViewController(newViewController, animated: true)
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
