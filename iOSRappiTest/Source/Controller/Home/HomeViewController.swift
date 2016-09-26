//
//  HomeViewController.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/25/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!
    
    var canStart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveDataIntoRealm()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        animateLogo()
        animateStartButton()
    }
    
    func animateStartButton(){
        self.startButton.transform = CGAffineTransformMakeScale(0, 0)
        
        UIView.animateWithDuration(2){
            self.startButton.transform = CGAffineTransformMakeScale(1, 1)
        }
    }
    
    func animateLogo(){
        UIView.animateWithDuration(
            1.5,
            animations: {
                self.logoImage.transform = CGAffineTransformMakeScale(0.9, 0.9)
            },
            completion: { finish in
                UIView.animateWithDuration(
                    1.5,
                    animations: {
                        self.logoImage.transform = CGAffineTransformMakeScale(1.2, 1.2)
                    },
                    completion: { finish in
                        self.animateLogo()
                })
        })
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func saveDataIntoRealm(){
        let internetConnetion = NetworkKit.isConnectedToNetwork()
        if !internetConnetion{
            
            var message : String = ""
            var title : String = ""
            
            let realm = try! Realm()
            let apps = realm.objects(RApp).sorted("name", ascending: true)
            
            if apps.count > 0{
                title = "Warning"
                message = "The Internet connection appears to be offline. Last connection data will be used."
                self.canStart = true
            }else{
                self.canStart = false
                title = "Error"
                message = "You need internet conexion to get started with this application."
            }
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default) { (alert: UIAlertAction!) -> Void in
            }
            alert.addAction(defaultAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }else{
            NetworkKit.fetchData(RApp.self, success: {
                self.startButton.backgroundColor = UIColor(red: 235/255, green: 53/255, blue: 62/255, alpha: 1)
                self.canStart = true
            }) { (error) in
                print("error \(error)")
            }
            print("Realm path \(Realm.Configuration.defaultConfiguration.fileURL!)")
        }
    }
    
    func start(){
        self.pushViewControllerWithAnimation(Controllers.instantiateCategoriesViewController())
    }
    
    @IBAction func startButtonTapped(sender: UIButton) {
        if canStart{
            start()
        }else{
            saveDataIntoRealm()
        }
    }
}
