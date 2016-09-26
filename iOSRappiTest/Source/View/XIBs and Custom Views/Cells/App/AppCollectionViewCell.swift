//
//  AppCollectionViewCell.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/25/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit

class AppCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var app : RApp!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(app : RApp){
        self.app = app
        nameLabel.text = app.name
        nameLabel.layer.cornerRadius = 10
        nameLabel.layer.borderWidth = 2
        nameLabel.layer.borderColor = UIColor.lightGrayColor().CGColor
        nameLabel.layer.masksToBounds = true
    }
}
