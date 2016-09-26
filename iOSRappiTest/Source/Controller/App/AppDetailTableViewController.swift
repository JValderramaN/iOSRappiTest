//
//  AppDetailTableViewController.swift
//  iOSRappiTest
//
//  Created by José Valderrama on 9/25/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit

private let cellIdentifierInfo = "appDetailInfoTableViewCell"
private let cellIdentifierImageInfo = "appDetailImageInfoTableViewCell"
private let cellIdentifierImageInfoSummary = "appDetailInfoSummaryTableViewCell"

private let cellOptions = ["Name:", "ID:", "Title:", "Category:", "Price:", "Artist:", "Summary:", "Content Type:", "Rights:", "Release Date:", ""]

class AppDetailTableViewController: UITableViewController {

    var app : RApp?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 70
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.popWithAnimation()
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return cellOptions.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierImageInfo, forIndexPath: indexPath) as! AppDetailImageInfoTableViewCell
            cell.setData(app?.imageURL)
            return cell
        }else{
            var cell  : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierInfo, forIndexPath: indexPath) as! AppDetailInfoTableViewCell
            
            switch indexPath.row {
            case 0:
                (cell as! AppDetailInfoTableViewCell).setData(cellOptions[indexPath.row], detailInfoLabel: app?.name)
            case 1:
                (cell as! AppDetailInfoTableViewCell).setData(cellOptions[indexPath.row], detailInfoLabel: app?.id)
            case 2:
                (cell as! AppDetailInfoTableViewCell).setData(cellOptions[indexPath.row], detailInfoLabel: app?.title)
            case 3:
                (cell as! AppDetailInfoTableViewCell).setData(cellOptions[indexPath.row], detailInfoLabel: app?.category!.label, moreInfoEnable: true)
            case 4:
                (cell as! AppDetailInfoTableViewCell).setData(cellOptions[indexPath.row], detailInfoLabel: "\(app!.price!.amount) \(app!.price!.currency)")
            case 5:
                (cell as! AppDetailInfoTableViewCell).setData(cellOptions[indexPath.row], detailInfoLabel: app?.artist?.label, moreInfoEnable: true)
            case 6:
                cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifierImageInfoSummary, forIndexPath: indexPath) as! AppDetailInfoSummaryTableViewCell

                (cell as! AppDetailInfoSummaryTableViewCell).cellIndex = indexPath
                (cell as! AppDetailInfoSummaryTableViewCell).delegate = self
                (cell as! AppDetailInfoSummaryTableViewCell).setData(cellOptions[indexPath.row], detailInfoLabel: app?.summary)
            case 7:
                (cell as! AppDetailInfoTableViewCell).setData(cellOptions[indexPath.row], detailInfoLabel: app?.contentType)
            case 8:
                (cell as! AppDetailInfoTableViewCell).setData(cellOptions[indexPath.row], detailInfoLabel: app?.rights)
            case 9:
                
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
                let date = dateFormatter.dateFromString(app!.releaseDate)
                dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
                let dateString = dateFormatter.stringFromDate(date!)
                
                (cell as! AppDetailInfoTableViewCell).setData(cellOptions[indexPath.row], detailInfoLabel: dateString)
            case 10:
                (cell as! AppDetailInfoTableViewCell).setData(cellOptions[indexPath.row], detailInfoLabel: "Go to the App Store!", moreInfoEnable: true)
            default:
                return cell
            }
            
            return cell
        }
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var url : String = ""
            
        switch indexPath.row {
        case 3:
            url = app!.category!.href
        case 5:
            url = app!.artist!.href
        case 10:
            url = app!.href
        default:
            url = ""
        }
        
        if let url = NSURL(string: url) {
                UIApplication.sharedApplication().openURL(url)
        }
    }
    
    override func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return indexPath.section != 0 && (indexPath.row == 3 || indexPath.row == 5 || indexPath.row == 10)
    }
    
    
}

// MARK: - AppDetailInfoSummaryDelegate

extension AppDetailTableViewController : AppDetailInfoSummaryDelegate{
    func showMoreLessButtonTapped(index: NSIndexPath){
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        tableView.scrollToRowAtIndexPath(index, atScrollPosition: UITableViewScrollPosition.Top, animated: true)
    }
}
