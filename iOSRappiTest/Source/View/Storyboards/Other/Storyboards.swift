//
//  Storyboards.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/24/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit

/// Stores the names of the project's storyboards
struct Storyboards {
    
    private init() {}
    
    /// Contains the main controllers
    static var home: UIStoryboard { return UIStoryboard(name: "Home", bundle: nil) }
    static var category: UIStoryboard { return UIStoryboard(name: "Category", bundle: nil) }
    static var app: UIStoryboard { return UIStoryboard(name: "App", bundle: nil) }
}