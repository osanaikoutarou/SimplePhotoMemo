//
//  ShadowCreator.swift
//  SimplePhotoMemo
//
//  Created by osanai on 2018/10/12.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class ShadowCreator: NSObject {

    static func addShadow(view:UIView) {
        let shadowView = UIView(frame: view.bounds)
        shadowView.layer.shadowOffset = CGSize(width: 10, height: 10)
        shadowView.layer.shadowColor = UIColor.red.cgColor
        shadowView.layer.shadowRadius = 1.0
        shadowView.layer.shadowRadius = 3.0
        shadowView.layer.cornerRadius = view.layer.cornerRadius
        view.superview!.insertSubview(shadowView, belowSubview: view)
    }
    
}
