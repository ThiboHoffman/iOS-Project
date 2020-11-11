//
//  TypeGameController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 09/11/2020.
//

import UIKit

class TypeGameController: UIViewController {

    
    var stackView: UIStackView!
    var casualBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpContraints()
    }
    
    
    func setUpView() {
        
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
        
        stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 8.0
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(casualBtn)
        view.addSubview(stackView)
    }
    
    func setUpContraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
        
    }
    
    @objc func pushNavViewController() {
        let newViewController = GameViewController()
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
