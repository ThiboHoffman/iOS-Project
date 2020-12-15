//
//  MyCardsViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 21/11/2020.
//

import UIKit

class MyCardsViewController: UIViewController {

    var tableView: UITableView!
    
    var myCards: [CardOnline]! = nil
    
    let reuseIdentifier = "cardCellReuse"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.background()
        title = "My cards"
                
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyCardTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addTapped))

    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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


