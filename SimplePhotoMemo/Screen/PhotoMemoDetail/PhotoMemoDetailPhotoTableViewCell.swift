//
//  PhotoMemoDetailPhotoTableViewCell.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/18.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class PhotoMemoDetailPhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoImageViewTop: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.image = UIImage(named: "huukei1")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedPhotoImageView))
        photoImageView.addGestureRecognizer(tap)
    }
    
    @objc
    func tappedPhotoImageView(sender:UIGestureRecognizer) {
        MyNotificationCenter.shared.post(type: .showImageViewer, sender: nil)
    }
    
}
