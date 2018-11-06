//
//  UIViewController+Sizes.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/11/06.
//  Copyright © 2018年 osanai. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    var navigationBarHeight: CGFloat {
        return navigationController?.navigationBar.frame.height ?? 0
    }
    var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }
    var safeareaTop: CGFloat {
        let window = UIApplication.shared.keyWindow
        return (window?.safeAreaInsets.top)!
    }
    var topBarAllHeight: CGFloat {
        return navigationBarHeight + statusBarHeight + safeareaTop
    }
}
