//
//  OnlineGameViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 16/11/2020.
//

import UIKit

class OnlineGameViewController: UIViewController {

    var cards: [CardOnline]!
    var text: UILabel!
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
        
        NetworkManager.getCards { cards in
            self.cards = cards
            self.showCard()
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
        text.text = cards[current].text
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
