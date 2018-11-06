//
//  Theme.swift
//  SimplePhotoMemo
//
//  Created by osanai on 2018/11/06.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

enum Theme: String {
    case keyColor = "keyColor"
    case subKeyColor = "subKeyColor"
    
    var color:UIColor {
        return UIColor(named: self.rawValue)!
    }
    var cgColor:CGColor {
        return color.cgColor
    }
}

class Hoge: NSObject {
    func hoge() {
        let color = Theme.keyColor.color
    }
}
