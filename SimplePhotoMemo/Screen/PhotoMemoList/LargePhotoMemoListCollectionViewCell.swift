//
//  LargePhotoMemoListCollectionViewCell.swift
//  SimplePhotoMemo
//
//  Created by osanai on 2018/10/16.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class LargePhotoMemoListCollectionViewCell: UICollectionViewCell {
    static let cellSize = CGSize(width: UIScreen.main.bounds.width - 20,
                                 height: (UIScreen.main.bounds.width - 20) * 500.0/355.0)
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var memoLabel: LineSpacingLabel!
    
    func setup(photoMemo:PhotoMemo) {
        imageView.image = UIImage(named: "huukei1")
        imageView.corner(radius: 10)
    }
}
