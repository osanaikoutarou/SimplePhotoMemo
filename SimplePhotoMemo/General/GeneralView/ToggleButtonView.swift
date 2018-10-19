//
//  ToggleButtonView.swift
//  SimplePhotoMemo
//
//  Created by osanai on 2018/10/19.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

@objcMembers
class ToggleButtonView: UIView {

    class State {
        var identifier:String
        var buttonView:ButtonView

        init(identifier:String, buttonView:ButtonView) {
            self.identifier = identifier
            self.buttonView = buttonView
        }
    }
    
    var currentIndex:Int = 0
    var buttonState:[State] = []
    var didChangeState:((_ state:State) -> ())?
    
    func addButtonState(value:State) {
        buttonState.append(value)
    }

    @objc func tapped() {
        currentIndex = (currentIndex+1) % buttonState.count
        refreshState()
        
        if let didChangeState = didChangeState {
            didChangeState(buttonState[currentIndex])
        }
    }
    
    func refreshState() {
        let currentButtonView = buttonState[currentIndex].buttonView
        self.bringSubview(toFront: currentButtonView)
    }
    
    func setup() {
        self.subviews.forEach { $0.removeFromSuperview() }
        buttonState.forEach {
            addSubview($0.buttonView)
            $0.buttonView.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        }
        refreshState()
    }
    
}
