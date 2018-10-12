//
//  UIView+Shadow.swift
//  EventWorks
//
//  Created by osanai on 2018/04/24.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

let shadowViewTag = 1000001

extension UIView {

    func addBelowShadowView(shadowColor:UIColor,
                            shadowOffset:CGSize,
                            shadowOpacity:Float,
                            shadowRadius:CGFloat) {
        
        addBelowShadowView(shadowColor: shadowColor, shadowOffset: shadowOffset, shadowOpacity: shadowOpacity, shadowRadius: shadowRadius, tag:shadowViewTag)
    }
    
    func addBelowShadowView(shadowColor:UIColor,
                            shadowOffset:CGSize,
                            shadowOpacity:Float,
                            shadowRadius:CGFloat,
                            tag:Int) {
        
        guard let superview = self.superview else {
            print("shadow error")
            return;
        }
        
        let shadowView = ShadowView(frame:self.frame)
        shadowView.tag = tag
        shadowView.addShadow(shadowColor: shadowColor,
                             shadowOffset: shadowOffset,
                             shadowOpacity: shadowOpacity,
                             shadowRadius: shadowRadius,
                             cornerRadius: self.layer.cornerRadius)
        
        superview.insertSubview(shadowView, belowSubview: self)

        shadowView.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.height)
            make.center.equalTo(self.snp.center)
        }
    }

    // remove
    func removeShadowView(tag:Int) {
        self.subviews.forEach { (subView) in
            if (subView.tag == tag) {
                subView.removeFromSuperview()
            }
        }
    }
    func removeShadowView() {
        removeShadowView(tag:shadowViewTag)
    }
    
    // hidden
    func hideShadowView(tag:Int,isHidden:Bool) {
        self.subviews.forEach { (subView) in
            if (subView.tag == tag) {
                subView.isHidden = isHidden
            }
        }
    }
    func hideShadowView(isHidden:Bool) {
        hideShadowView(tag:shadowViewTag, isHidden:isHidden)
    }
    

}
