//
//  BaseSlideMenuViewController.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/14.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class BaseSlideMenuViewController: SlideMenuController {

    static let rightMenuWidth:CGFloat = SlideMenuOptions.rightViewWidth
    
    override func awakeFromNib() {
        //ライブラリ特有のプロパティにセット
        mainViewController = UIStoryboard(name: "PhotoMemoList", bundle: nil).instantiateInitialViewController()
        rightViewController = storyboard?.instantiateViewController(withIdentifier: "RightMenuViewController")
        
//        SlideMenuOptions.leftViewWidth = 250
        SlideMenuOptions.rightViewWidth = UIScreen.main.bounds.width - 50
        SlideMenuOptions.contentViewScale = 1.0
        SlideMenuOptions.simultaneousGestureRecognizers = false
        SlideMenuOptions.animationDuration = 0.2
        
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
