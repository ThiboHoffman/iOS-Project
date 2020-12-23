//
//  MyCardPreviewViewController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/11/2020.
//

import UIKit

class MyCardPreviewViewController: UIViewController {

    var card: CardOnline!
    var myCardPreviewView = MyCardPreviewView()
    
    override func viewDidLoad() {
        view = myCardPreviewView        
        setUpView()
    }
    
    func setUpView() {
        myCardPreviewView.textLabel.text = card.text.replacingOccurrences(of: "(name)", with: "Bill Gates")
    }
}
