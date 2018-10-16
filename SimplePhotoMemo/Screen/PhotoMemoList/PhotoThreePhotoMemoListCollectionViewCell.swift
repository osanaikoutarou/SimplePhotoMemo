//
//  PhotoThreePhotoMemoListCollectionViewCell.swift
//  SimplePhotoMemo
//
//  Created by osanai on 2018/10/16.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class PhotoThreePhotoMemoListCollectionViewCell: UICollectionViewCell {
    static let cellSize = CGSize(width: (UIScreen.main.bounds.width - 9)/3.0,
                                 height: (UIScreen.main.bounds.width - 9)/3.0 * 1.4)
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var memoLabel: LineSpacingLabel!
    
    func setup(photoMemo:PhotoMemo) {
        imageView.image = UIImage(named: "huukei1")
    }
}
