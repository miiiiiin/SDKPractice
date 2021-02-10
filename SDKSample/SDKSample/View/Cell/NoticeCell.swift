//
//  NoticeCell.swift
//  SDKSample
//
//  Created by Running Raccoon on 2021/02/09.
//

import UIKit

class NoticeCell: UITableViewCell {
    
    @IBOutlet weak var noticeTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.noticeTitleLabel.text = ""
        self.dateLabel.text = ""
    }
}
