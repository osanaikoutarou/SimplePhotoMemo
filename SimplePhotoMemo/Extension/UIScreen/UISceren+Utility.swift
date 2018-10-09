//
//  UISceren+Utility.swift
//  EventWorks
//
//  Created by 長内幸太郎 on 2018/04/24.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen {
    static func px() -> CGFloat {
        return 1.0/self.main.scale;
    }
    
    static func bottomSafearea() -> CGFloat {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            return (window?.safeAreaInsets.bottom)!
        }
        return 0
    }
}

