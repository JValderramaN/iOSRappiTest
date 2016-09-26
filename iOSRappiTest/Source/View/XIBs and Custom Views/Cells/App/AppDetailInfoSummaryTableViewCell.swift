//
//  AppDetailInfoSummaryTableViewCell.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/25/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit

protocol AppDetailInfoSummaryDelegate: class {
    func showMoreLessButtonTapped(index: NSIndexPath)
}

class AppDetailInfoSummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var detailInfoLabel: UILabel!
    @IBOutlet weak var showMoreLessButton: UIButton!
    
    var isExpanded : Bool = false
    var cellIndex : NSIndexPath?
    weak var delegate: AppDetailInfoSummaryDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(infoLabel : String, detailInfoLabel : String?){
        self.infoLabel.text = infoLabel
        self.detailInfoLabel.text = detailInfoLabel
        self.detailInfoLabel.numberOfLines = 2
        isExpanded = false
    }
    
    @IBAction func showMoreLessButtonTapped(sender: UIButton) {
        self.detailInfoLabel.numberOfLines = isExpanded ? 2 : 0
        self.showMoreLessButton.setTitle(isExpanded ? "Show more" : "Show less", forState: .Normal)
        self.isExpanded = !isExpanded
        delegate?.showMoreLessButtonTapped(cellIndex!)
    }
}
