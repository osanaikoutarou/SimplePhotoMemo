//
//  CGPoint+Utility.swift
//  MyEki
//
//  Created by osanai on 2018/10/01.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import Foundation
import UIKit

extension CGPoint {
    func scale(_ value:CGFloat) -> CGPoint {
        return CGPoint(x: x * value, y: y * value)
    }
    func relative(_ x:CGFloat, _ y:CGFloat) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y + y)
    }
}
