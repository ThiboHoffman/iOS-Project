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
        return UIColor(red: 248.0/255.0, green: 242.0/255.0, blue: 220.0/255.0, alpha:1.0)
    }

    class func accent() -> UIColor
    {
        return UIColor(red: 205.0/255.0, green: 70.0/255.0, blue: 49.0/255.0, alpha:1.0)
    }
    
    class func accentBackground() -> UIColor
    {
        return UIColor(red: 222.0/255.0, green: 164.0/255.0, blue: 126.0/255.0, alpha:1.0)
    }
    
    class func text() -> UIColor
    {
        return UIColor(red: 158.0/255.0, green: 98.0/255.0, blue: 63.0/255.0, alpha:1.0)
    }
}


extension CGColor
{
    class func background() -> CGColor
    {
        return CGColor(red: 248.0/255.0, green: 242.0/255.0, blue: 220.0/255.0, alpha:1.0)
    }

    class func accent() -> CGColor
    {
        return CGColor(red: 205.0/255.0, green: 70.0/255.0, blue: 49.0/255.0, alpha:1.0)
    }
    
    class func accentBackground() -> CGColor
    {
        return CGColor(red: 222.0/255.0, green: 164.0/255.0, blue: 126.0/255.0, alpha:1.0)
    }
    
    class func text() -> CGColor
    {
        return CGColor(red: 158.0/255.0, green: 98.0/255.0, blue: 63.0/255.0, alpha:1.0)
    }
}

extension UIButton {
    class func choiceButton() -> UIButton {
        let button: UIButton = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        button.setTitleColor(UIColor.accent(), for: .normal)
        button.backgroundColor = UIColor.accentBackground()
        button.layer.borderWidth = 5
        button.layer.borderColor = CGColor.accent()
        button.layer.cornerRadius = 45
        return button
    }
}
