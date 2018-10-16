//
//  PhotoMemo.swift
//  SimplePhotoMemo
//
//  Created by osanai on 2018/10/16.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class PhotoMemo: NSObject {
    
    var memo:String = ""
    var imgUrls:[URL] = []
    var imgs:[UIImage] = []

    // option
    var tagModels:[TagModel] = []
}
