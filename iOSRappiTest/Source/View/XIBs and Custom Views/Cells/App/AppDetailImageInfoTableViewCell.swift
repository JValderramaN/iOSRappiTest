//
//  AppDetailImageInfoTableViewCell.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/25/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import Kingfisher

class AppDetailImageInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(imageURL : String?){
        if let imageURL = imageURL{
            let url = NSURL(string: imageURL)
            imageview.kf_setImageWithURL(url)
        }
    }
}
