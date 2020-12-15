//
//  Style.swift
//  iosApps
//
//  Created by Thibo Hoffman on 20/11/2020.
//

import Foundation
import UIKit

extension UIColor
{
    class func background() -> UIColor
    {
        return UIColor(red: 249.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha:1.0)
    }

    class func accent() -> UIColor
    {
        return UIColor(red: 63.0/255.0, green: 114.0/255.0, blue: 175.0/255.0, alpha:1.0)
    }
    
    class func accentBackground() -> UIColor
    {
        return UIColor(red: 219.0/255.0, green: 226.0/255.0, blue: 239.0/255.0, alpha:1.0)
    }
    
    class func text() -> UIColor
    {
        return UIColor(red: 17.0/255.0, green: 45.0/255.0, blue: 78.0/255.0, alpha:1.0)
    }
}


extension CGColor
{
    class func background() -> CGColor
    {
        return CGColor(red: 249.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha:1.0)
    }

    class func accent() -> CGColor
    {
        return CGColor(red: 63.0/255.0, green: 114.0/255.0, blue: 175.0/255.0, alpha:1.0)
    }
    
    class func accentBackground() -> CGColor
    {
        return CGColor(red: 219.0/255.0, green: 226.0/255.0, blue: 239.0/255.0, alpha:1.0)
    }
    
    class func text() -> CGColor
    {
        return CGColor(red: 17.0/255.0, green: 45.0/255.0, blue: 78.0/255.0, alpha:1.0)
    }
}

extension UIButton {
    class func choiceButton() -> UIButton {
        let button: UIButton = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        button.setTitleColor(UIColor.text(), for: .normal)
        button.backgroundColor = UIColor.accentBackground()
        button.layer.borderWidth = 5
        button.layer.borderColor = CGColor.accent()
        button.layer.cornerRadius = 45
        return button
    }
}


var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
