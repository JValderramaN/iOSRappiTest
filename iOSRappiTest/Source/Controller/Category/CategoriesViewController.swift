//
//  CategoriesViewController.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/24/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import RealmSwift

protocol CategoriesDelegate : class{
    func didSelectCategory(category : RAppCategory)
}

class CategoriesViewController: UIViewController {
    
    
    @IBOutlet weak var container: UIView!
    var pushActive = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategoriesViewController()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        pushActive = false
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if !self.pushActive{
            self.popWithAnimation()
        }
    }
    
    func loadCategoriesViewController(){
        var viewController : UIViewController?
        
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone {
            let caterogiesVC = Controllers.instantiateCategoriesTableViewController()
            caterogiesVC.categories = loadCategories()
            caterogiesVC.delegate = self
            viewController = caterogiesVC
        }else if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad {
            let caterogiesVC = Controllers.instantiateCategoriesCollectionViewController()
            caterogiesVC.categories = loadCategories()
            caterogiesVC.delegate = self
            viewController = caterogiesVC
        }

        if let viewController = viewController {
            displayContentController(viewController)
        }
    }
    
    func loadCategories() -> Results<RAppCategory>{
        let realm = try! Realm()
        return realm.objects(RAppCategory).sorted("label", ascending: true)
    }
    
    func displayContentController(contentVC : UIViewController ) {
        self.addChildViewController(contentVC)
        contentVC.view.frame = CGRectMake(0, 0, self.container.frame.size.width, self.container.frame.size.height)
        self.container.addSubview(contentVC.view)
        contentVC.didMoveToParentViewController(self)
    }
}

//MARK: - CategoriesDelegate

extension CategoriesViewController : CategoriesDelegate{
    func didSelectCategory(category : RAppCategory){
        let appVC = Controllers.instantiateAppsViewController()
        appVC.category = category
        self.pushActive = true
        self.pushViewControllerWithAnimation(appVC)
    }
}