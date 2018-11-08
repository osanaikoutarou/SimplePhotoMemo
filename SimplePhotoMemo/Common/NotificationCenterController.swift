//
//  NotificationCenterController.swift
//  SimplePhotoMemo
//
//  Created by osanai on 2018/11/08.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

typealias NCCAction = ((_ sender:Any?) -> Void)
class MyNotificationCenter: NSObject {
    
    static let shared = MyNotificationCenter()
    var actions:[ObserverType:NCCAction?] = [:]
    
    enum ObserverType {
        case showImageViewer
    }
    
    func add(observer type:ObserverType, action:@escaping NCCAction) {
        actions[type] = action
    }
    func remove(observer type:ObserverType) {
        actions[type] = nil
    }
    func post(type:ObserverType, sender:Any?) {
        guard let actionwk = actions[type] ,
            let action = actionwk else {
                return
        }
        action(sender)
    }
}

extension MyNotificationCenter {
    
//    func addObserverShowImageViewer(action:@escaping ((_ sender:String) -> Void)) {
//        add(observer: .showImageViewer, action: action)
//    }
    
}

