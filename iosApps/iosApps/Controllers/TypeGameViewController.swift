//
//  TypeGameController.swift
//  iosApps
//
//  Created by Thibo Hoffman on 09/11/2020.
//

import UIKit
import GoogleMobileAds

class TypeGameViewController: UIViewController {
    
    var game: GameModel!
    var typeGameView = TypeGameView()
    
    var interstitial: GADInterstitial!
    
    override func viewDidLoad() {
        view = typeGameView

        setUpView()
    }
    
    func setUpView() {
        interstitial = createAndLoadAd()
        
        title = "Choose game type"
        typeGameView.casualBtn.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        typeGameView.wildBtn.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        typeGameView.onlineBtn.addTarget(self, action: #selector(pushOnlineViewController), for: .touchUpInside)
    }
    
    @objc func pushNavViewController(sender: UIButton) {
        let newViewController = GameViewController()
        game.type = sender.currentTitle!
        newViewController.game = game
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
            interstitial = createAndLoadAd()
          } else {
            print("Ad wasn't ready")
        }
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func pushOnlineViewController(sender: UIButton) {
        if NetworkManager.Connectivity.isConnectedToInternet {
            let newViewController = OnlineSearchViewController()
            newViewController.game = self.game
            self.navigationController?.pushViewController(newViewController, animated: true)
         } else {
            let alert = UIAlertController(title: "You are not connected to the internet.", message: "Please connect to internet to play the online game.", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            
            self.present(alert, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func createAndLoadAd() -> GADInterstitial {

        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        request.testDevices = ["2077ef9a63d2b398840261c8221a0c9b"]
        interstitial.load(request)
        return interstitial
    }
}
