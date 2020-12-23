//
//  MyCardsViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 21/11/2020.
//

import UIKit

class MyCardsViewController: UIViewController {
    
    var myCards: [CardOnline]! = nil
    var myCardsTableView = MyCardsTableView()
    let reuseIdentifier = "cardCellReuse"

    override func viewDidLoad() {
        view = myCardsTableView
        setUpView()
    }
    
    func setUpView() {
        title = "My cards"
        
        myCardsTableView.tableView.dataSource = self
        myCardsTableView.tableView.delegate = self
        myCardsTableView.tableView.register(MyCardTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addTapped))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if (self.isMovingFromParent) {
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: HomeViewController.self) {
                    controller.viewDidLoad()
                    self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
        }
    }
    
    @objc func addTapped() {
        let newViewController = AddCardViewController()
        navigationController?.pushViewController(newViewController, animated: true)
    }
}

extension MyCardsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.myCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MyCardTableViewCell
        let card = myCards[indexPath.row]
        cell.backgroundColor = UIColor.background()
        cell.configure(for: card)
        return cell
    }
}

extension MyCardsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myCard = myCards[indexPath.row]
        print(myCard)
        //let cell = tableView.cellForRow(at: indexPath) as! MyCardTableViewCell
        let newViewController = MyCardPreviewViewController()
        newViewController.card = myCard
        navigationController?.pushViewController(newViewController, animated: true)
    }
}


