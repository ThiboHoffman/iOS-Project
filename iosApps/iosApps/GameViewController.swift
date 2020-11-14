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
    var indices: [Int] = []
    var current: Int = 0
    var cardsWanted: Int = 5
    var cardsPresent: Int = 0
    
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
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameViewController.handleTap))
        text.isUserInteractionEnabled = true
        text.addGestureRecognizer(gestureRecognizer)
        
        guard let path = Bundle.main.path(forResource: "cards", ofType: "json") else { return }

        let url = URL(fileURLWithPath: path)

        do {

            let data = try Data(contentsOf: url)

            let json = try JSON(data: data)
            cardsPresent = json[game.type.lowercased()]["cards"].count
            print(cardsPresent)
            getIndices()
            
            print(indices)
            for index in indices {
                if let textString = json[game.type.lowercased()]["cards"].array?[index-1]["text"].string {
                    cards.append(textString.replacingOccurrences(of: "${name}", with: String(game.players[Int.random(in: 0...(game.players.count-1))])))
                }
            }
            print(cards)
            showCard()
            
        } catch {

            print(error)
        }
        
        view.addSubview(text)
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    func showCard() {
        text.text = cards[current]
    }
    
    func getIndices() {
        for _ in 0...cardsWanted {
            var rand = Int.random(in: 1...cardsPresent)
            while (indices.contains(rand)) {
                rand = Int.random(in: 1...cardsPresent)
            }
            indices.append(rand)
        }
    }
    
    @IBAction func handleTap(sender:UITapGestureRecognizer) {
        current += 1
        if (current == cards.count-1) {
            navigationController?.popViewController(animated: true)
        }
        showCard()
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
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
