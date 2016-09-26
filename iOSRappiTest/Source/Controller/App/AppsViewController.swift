//
//  AppsViewController.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/25/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import RealmSwift

protocol AppsDelegate : class{
    func didSelectApp(app : RApp)
}

class AppsViewController: UIViewController {
    
    @IBOutlet weak var container: UIView!
    var category : RAppCategory?
    var pushActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = category?.label
        loadAppsViewController()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillDisappear(animated)
        pushActive = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if !self.pushActive{
            self.popWithAnimation()
        }
    }
    
    func loadAppsViewController(){
        var viewController : UIViewController?
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone {
            let appsVC = Controllers.instantiateAppsTableViewController()
            appsVC.apps = loadApps()
            appsVC.delegate = self
            viewController = appsVC
        }else if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad {
            let appsVC = Controllers.instantiateAppsCollectionViewController()
            appsVC.apps = loadApps()
            appsVC.delegate = self
            viewController = appsVC
        }
        
        if let viewController = viewController {
            displayContentController(viewController)
        }
    }

    func loadApps() -> Results<RApp>{
        let realm = try! Realm()
        let predicateCategory = NSPredicate(format: "%@ = category", category!)
        return realm.objects(RApp).filter(predicateCategory).sorted("name", ascending: true)
    }
    
    func displayContentController(contentVC : UIViewController ) {
        self.addChildViewController(contentVC)
        contentVC.view.frame = CGRectMake(0, 0, self.container.frame.size.width, self.container.frame.size.height)
        self.container.addSubview(contentVC.view)
        contentVC.didMoveToParentViewController(self)
    }
}

// MARK: - AppsDelegate

extension AppsViewController: AppsDelegate{
    func didSelectApp(app : RApp){
        let appDetailVC = Controllers.instantiateAppDetailTableViewController()
        appDetailVC.app = app
        self.pushActive = true
        self.pushViewControllerWithAnimation(appDetailVC)
    }
}