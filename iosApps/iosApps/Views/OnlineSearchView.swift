//
//  OnlineSearchView.swift
//  iosApps
//
//  Created by Thibo Hoffman on 22/12/2020.
//

import Foundation
import UIKit

class OnlineSearchView: UIView {
    
    var minLabel: UILabel!
    var segmentMin: UISegmentedControl!
    var maxLabel: UILabel!
    var segmentMax: UISegmentedControl!
    var startGameBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
        setUpConstraints()
    }
    

    func setUpView() {
        
        minLabel = UILabel()
        minLabel.text = "Minumum like percentage"
        minLabel.textColor = UIColor.text()
        minLabel.textAlignment = .center
        minLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        minLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(minLabel)
        
        backgroundColor = UIColor.background()
        segmentMin = UISegmentedControl()
        segmentMin.insertSegment(withTitle: "0", at: 0, animated: true)
        segmentMin.insertSegment(withTitle: "25", at: 1, animated: true)
        segmentMin.insertSegment(withTitle: "50", at: 2, animated: true)
        segmentMin.insertSegment(withTitle: "75", at: 3, animated: true)
        segmentMin.selectedSegmentTintColor = UIColor.accent()
        segmentMin.tintColor = UIColor.text()
        segmentMin.translatesAutoresizingMaskIntoConstraints = false
        addSubview(segmentMin)
        
        maxLabel = UILabel()
        maxLabel.text = "Maximum like percentage"
        maxLabel.textColor = UIColor.text()
        maxLabel.textAlignment = .center
        maxLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        maxLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(maxLabel)
        
        segmentMax = UISegmentedControl()
        segmentMax.insertSegment(withTitle: "25", at: 0, animated: true)
        segmentMax.insertSegment(withTitle: "50", at: 1, animated: true)
        segmentMax.insertSegment(withTitle: "75", at: 2, animated: true)
        segmentMax.insertSegment(withTitle: "100", at: 3, animated: true)
        segmentMax.selectedSegmentTintColor = UIColor.accent()
        segmentMax.tintColor = UIColor.text()
        segmentMax.translatesAutoresizingMaskIntoConstraints = false
        addSubview(segmentMax)
        
        startGameBtn = UIButton.choiceButton()
        startGameBtn.setTitle("Start game", for: .normal)
        startGameBtn.translatesAutoresizingMaskIntoConstraints = false
        addSubview(startGameBtn)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            minLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            minLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200)
        ])
        NSLayoutConstraint.activate([
            segmentMin.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmentMin.topAnchor.constraint(equalTo: minLabel.bottomAnchor, constant: 20),
            segmentMin.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)
        ])
        NSLayoutConstraint.activate([
            maxLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            maxLabel.topAnchor.constraint(equalTo: segmentMin.bottomAnchor, constant: 30),
            maxLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)
        ])
        NSLayoutConstraint.activate([
            segmentMax.centerXAnchor.constraint(equalTo: centerXAnchor),
            segmentMax.topAnchor.constraint(equalTo: maxLabel.bottomAnchor, constant: 20),
            segmentMax.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)
        ])
        NSLayoutConstraint.activate([
            startGameBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            startGameBtn.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            startGameBtn.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            startGameBtn.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
    }
}
