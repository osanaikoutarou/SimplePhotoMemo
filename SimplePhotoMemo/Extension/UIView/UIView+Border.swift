//
//  UIView+Border.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/04/17.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
        
    func ellipse(borderColor:UIColor, borderWidth:CGFloat) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = (self.width > self.height) ? self.height/2.0 : self.width/2.0
        self.clipsToBounds = true
    }
    
    func border(borderColor:UIColor, borderWidth:CGFloat) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
}
