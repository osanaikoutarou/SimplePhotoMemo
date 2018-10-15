//
//  TagTableViewCell.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/14.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class TagTableViewCell: UITableViewCell {

    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var tagPhotoNumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ tagModel:TagModel) {
        
        tagPhotoNumLabel.text = "\(tagModel.num)"
        tagLabel.text = tagModel.tag

    }
}
