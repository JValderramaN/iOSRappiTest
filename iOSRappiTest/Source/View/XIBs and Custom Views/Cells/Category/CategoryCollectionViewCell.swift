//
//  CategoryCollectionViewCell.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/25/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var category : RAppCategory!
    
    override func awakeFromNib() {
        super.awakeFromNib()        
    }
    
    func setData(category : RAppCategory){
        self.category = category
        nameLabel.text = category.label
        nameLabel.layer.cornerRadius = 10
        nameLabel.layer.borderWidth = 2
        nameLabel.layer.borderColor = UIColor.lightGrayColor().CGColor
        nameLabel.layer.masksToBounds = true
    }
}
