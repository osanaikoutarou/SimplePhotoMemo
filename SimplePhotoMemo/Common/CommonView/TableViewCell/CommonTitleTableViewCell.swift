//
//  CommonTitleTableViewCell.swift
//  EventWorks
//
//  Created by osanai on 2018/06/18.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import UIKit

class CommonTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var leftPadding: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(title:String) {
        titleLabel.text = title
    }

    
    
}
