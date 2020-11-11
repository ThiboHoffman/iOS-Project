//
//  GameViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 09/11/2020.
//

import UIKit
import SwiftyJSON

class GameViewController: UIViewController {

    var text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        setUpView()
        setUpConstraints()
    }
    
    func setUpView() {
        
        view.backgroundColor = .white
        
        text = UILabel()
        text.textColor = .black
        text.text = "Hallo"
        text.textAlignment = .center
        text.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        text.translatesAutoresizingMaskIntoConstraints = false
        
        guard let path = Bundle.main.path(forResource: "cards", ofType: "json") else { return }

        let url = URL(fileURLWithPath: path)

        do {

            let data = try Data(contentsOf: url)

            let json = try JSON(data: data)
            if let textString = json[0]["text"].string {
                text.text = textString
            }
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
    
    override var shouldAutorotate: Bool {
        return true
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
