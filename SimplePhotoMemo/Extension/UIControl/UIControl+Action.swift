//
//  UIControl+Action.swift
//  EventWorks
//
//  Created by osanai on 2018/04/19.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

typealias EmptyClosure = (() -> ())

class ClosureSleeve {
    let closure: EmptyClosure
    
    init (_ closure: @escaping EmptyClosure) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    func addAction (for controlEvents: UIControlEvents, _ closure: @escaping EmptyClosure) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
