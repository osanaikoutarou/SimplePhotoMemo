//
//  NormalPhotoMemoListCollectionViewCell.swift
//  
//
//  Created by osanai on 2018/10/16.
//

import UIKit

class NormalPhotoMemoListCollectionViewCell: UICollectionViewCell {
    static let cellSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 90)

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var memoLabel: LineSpacingLabel!
    
    func setup(photoMemo:PhotoMemo) {
        imageView.image = UIImage(named: "huukei1")
    }
}
