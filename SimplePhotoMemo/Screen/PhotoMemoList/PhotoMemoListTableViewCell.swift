//
//  PhotoMemoListTableViewCell.swift
//  SimplePhotoMemo
//
//  Created by osanai on 2018/10/09.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class PhotoMemoListTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var subInfoLabel: UILabel!
    
    @IBOutlet weak var memoLabel: LineSpacingLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.layer.cornerRadius = 10

    }


}
