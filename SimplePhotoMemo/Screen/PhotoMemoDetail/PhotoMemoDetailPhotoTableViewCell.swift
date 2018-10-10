//
//  PhotoMemoDetailPhotoTableViewCell.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/11.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class PhotoMemoDetailPhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.constraints.first(where: { $0.identifier == "ratio"} )?.constant = 400.0/375.0
    }


}
