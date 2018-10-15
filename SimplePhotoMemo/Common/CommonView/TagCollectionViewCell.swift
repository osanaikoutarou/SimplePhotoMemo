//
//  TagCollectionViewCell.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/14.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var tagView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tagView.layer.cornerRadius = 10
        tagView.clipsToBounds = true
    }
    
    func setup(_ tagModel:TagModel) {
        tagLabel.text = tagModel.tag
    }
}
