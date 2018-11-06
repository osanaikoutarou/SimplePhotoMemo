//
//  UIViewController+NavigationBar.swift
//  EventWorks
//
//  Created by osanai on 2018/04/19.
//  Copyright © 2018年 osanai.sample.eventworks. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func addMenuButton() {
        let button = UIButton.init(type: .system)
        button.setTitle("Menu", for: .normal)
        button.addAction(for: .touchUpInside) {
            if (self.slideMenuController()?.isLeftOpen())! {
                self.slideMenuController()?.openLeft()
            }
            else if (self.slideMenuController()?.isLeftHidden())! {
                self.slideMenuController()?.openLeft()
            }
        }
        let barButtonItem = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    
    func addStatesCheckButton() {
        let button = UIButton.init(type: .system)
        button.setTitle("仕事一覧導線", for: .normal)
        button.addAction(for: .touchUpInside) {
            let vc = UIStoryboard(name: "OrderParent", bundle: nil).instantiateInitialViewController()
            self .show(vc!, sender: nil)
        }
        let barButtonItem = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    func addPlacedWorkStatesCheckButton() {
        let button = UIButton.init(type: .system)
        button.setTitle("依頼仕事一覧", for: .normal)
        button.addAction(for: .touchUpInside) {
            let vc = UIStoryboard(name: "OrderParent", bundle: nil).instantiateInitialViewController()
            self .show(vc!, sender: nil)
        }
        let barButtonItem = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }

    
    func addCloseButton() {
        let button = UIButton.init(type: .system)
        let img = UIImage(named: "icon_close")
        if let img = img {
            button.setImage(img, for: .normal)
        }
        else {
            button.setTitle("✗", for: .normal)
        }
        button.addAction(for: .touchUpInside) {
            self.dismiss(animated: true, completion: {
            })
        }
        let barButtonItem = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    
//    func addProfileEditButton(action:@escaping EmptyClosure) {
//        let button = UIButton.init(type: .system)
//        button.setTitle("編集", for: .normal)
//        button.tintColor = AppStrategy.navButtonTextColor
//        button.addAction(for: .touchUpInside, action)
//        let barButtonItem = UIBarButtonItem.init(customView: button)
//        self.navigationItem.rightBarButtonItem = barButtonItem
//    }
    
    func addCompleteButton(action:@escaping EmptyClosure) {
        let button = UIButton.init(type: .system)
        button.setTitle("完了", for: .normal)
        button.addAction(for: .touchUpInside, action)
        let barButtonItem = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }

    func addSelectWorkerButton(action:@escaping EmptyClosure) {
        let button = UIButton.init(type: .system)
        button.setTitle("発注先を決定する", for: .normal)
        button.addAction(for: .touchUpInside, action)
        let barButtonItem = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    func addSearchButton(action:@escaping EmptyClosure) {
        let button = UIButton.init(type: .system)
        button.setImage(UIImage(named: "icon_search"), for: .normal)
        button.addAction(for: .touchUpInside, action)
        let barButtonItem = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }

    func addEditWorkRequestButton(action:@escaping EmptyClosure) {
        addAnyButtonToRight(title: "編集", action: action)
    }
    
    func addMessageButton(action:@escaping EmptyClosure) {
        addAnyButtonToRight(title: "メッセージ", action: action)
    }
    
    func addAnyButtonToRight(title:String, action:@escaping EmptyClosure) {
        let button = UIButton.init(type: .system)
        button.setTitle(title, for: .normal)
        button.addAction(for: .touchUpInside, action)
        let barButtonItem = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    //MARK: transparent navigationbar
    
    func setNavigationBarColor(navBarColor:UIColor, shadowColor:UIColor) {
        let navImg = UIImage(color: navBarColor, size: CGSize.pxSize())
        let shadowImg = UIImage(color: shadowColor, size: CGSize.pxSize())
        self.navigationController?.navigationBar.setBackgroundImage(navImg, for: .default)
        self.navigationController?.navigationBar.shadowImage = shadowImg
        self.navigationController?.navigationBar.backgroundColor = .clear
    }


}
