//
//  TagTableViewCell.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/14.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class TagTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tagLabel1: UILabel!
    @IBOutlet weak var tagNumLabel1: UILabel!
    @IBOutlet weak var tagLabel2: UILabel!
    @IBOutlet weak var tagNumLabel2: UILabel!
    @IBOutlet weak var separatorWidth: NSLayoutConstraint!
    @IBOutlet weak var tagView1: ButtonView!
    @IBOutlet weak var tagView2: ButtonView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        separatorWidth.constant = 1.0/UIScreen.main.scale
//        tagView1.setup(type: .darkerTheWhole)
//        tagView2.setup(type: .darkerTheWhole)
    }
    
    func setup(tagModel1:TagModel, tagModel2:TagModel?) {
        
        tagNumLabel1.text = "(\(tagModel1.num))"
        tagLabel1.text = tagModel1.tag

        if let tagModel2 = tagModel2 {
            tagLabel2.isHidden = false
            tagNumLabel2.isHidden = false
            
            tagNumLabel2.text = "(\(tagModel2.num))"
            tagLabel2.text = tagModel2.tag
        }
        else {
            tagLabel2.isHidden = true
            tagNumLabel2.isHidden = true
        }
    }
}
