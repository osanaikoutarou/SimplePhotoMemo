//
//  UIView+AutolayoutUtility.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/11/06.
//  Copyright © 2018年 osanai. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func updateConstraint(identifier:String, value:CGFloat ) {
        self.constraints.filter { $0.identifier == identifier }.forEach { $0.constant = value }
    }
}
