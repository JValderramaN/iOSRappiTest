//
//  Controllers.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/25/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation

/// Use this to instantiate any controllers programatically.
struct Controllers {
    
    private init() {}
    
    static func instantiateHomeViewController() -> HomeViewController {
        return Storyboards.home.instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
    }
    
    static func instantiateCategoriesViewController() -> CategoriesViewController {
        return Storyboards.category.instantiateViewControllerWithIdentifier("CategoriesViewController") as! CategoriesViewController
    }
    
    static func instantiateCategoriesCollectionViewController() -> CategoriesCollectionViewController {
        return Storyboards.category.instantiateViewControllerWithIdentifier("CategoriesCollectionViewController") as! CategoriesCollectionViewController
    }
    
    static func instantiateCategoriesTableViewController() -> CategoriesTableViewController {
        return Storyboards.category.instantiateViewControllerWithIdentifier("CategoriesTableViewController") as! CategoriesTableViewController
    }
    
    static func instantiateAppsViewController() -> AppsViewController {
        return Storyboards.app.instantiateViewControllerWithIdentifier("AppsViewController") as! AppsViewController
    }
    
    static func instantiateAppsCollectionViewController() -> AppsCollectionViewController {
        return Storyboards.app.instantiateViewControllerWithIdentifier("AppsCollectionViewController") as! AppsCollectionViewController
    }
    
    static func instantiateAppsTableViewController() -> AppsTableViewController {
        return Storyboards.app.instantiateViewControllerWithIdentifier("AppsTableViewController") as! AppsTableViewController
    }
    
    static func instantiateAppDetailTableViewController() -> AppDetailTableViewController {
        return Storyboards.app.instantiateViewControllerWithIdentifier("AppDetailTableViewController") as! AppDetailTableViewController
    }
}
