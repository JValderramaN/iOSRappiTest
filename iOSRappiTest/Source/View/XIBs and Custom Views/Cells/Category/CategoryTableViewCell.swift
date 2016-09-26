//
//  CategoryTableViewCell.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/25/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var category : RAppCategory!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(category : RAppCategory){
        self.category = category
        nameLabel.text = category.label
    }
}
