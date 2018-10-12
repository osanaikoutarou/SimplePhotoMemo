//
//  CommonTitleAndLabelTableViewCell.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/04/09.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import UIKit

class CommonTitleAndLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(title:String,content:String) {
        titleLabel.text = title
        contentLabel.text = content
    }

    
}
