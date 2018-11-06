//
//  TagCollectionViewCell.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/31.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class PhotoMemoDetailTagCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tagLabel: UILabel!
    
    // storyboardと合わせる(4つの値を取得するのがやや面倒なので)
    static var inset:UIEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.corner(radius: self.bounds.height/2)
        self.backgroundColor = UIColor.groupTableViewBackground

    }
}
