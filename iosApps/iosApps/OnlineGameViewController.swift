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
        
        NetworkManager.getCards { cards in
            self.cards = cards
            print(cards)
            self.showCard()
        }
            
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
        
        /*
        NSLayoutConstraint.activate([
            likeBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            likeBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            likeBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            likeBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2)
        ])
        */
    }
    
    @objc func showCard() {
        text.text = cards[current].text
    }
    
    @objc func like() {
        print("like")
    }
    
    @objc func dislike() {
        print("dislike")
    }
    
    @objc func report() {
        print("reported")
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
