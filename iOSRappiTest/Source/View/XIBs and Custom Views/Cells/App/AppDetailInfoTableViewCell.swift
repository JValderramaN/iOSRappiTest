//
//  AppDetailInfoTableViewCell.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/25/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit

class AppDetailInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var detailInfoLabel: UILabel!
    @IBOutlet weak var moreInfoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(infoLabel : String, detailInfoLabel : String?, moreInfoEnable : Bool = false){
        self.infoLabel.text = infoLabel
        self.detailInfoLabel.text = detailInfoLabel
        self.moreInfoLabel.hidden = !moreInfoEnable
    }
}
