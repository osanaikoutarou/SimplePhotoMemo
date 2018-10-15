//
//  RightMenuViewController.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/14.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class MenuTableView:UITableView {
    override func touchesShouldCancel(in view: UIView) -> Bool {
        return false
    }
}

class RightMenuViewController: UIViewController {

    @IBOutlet weak var menuTableView: MenuTableView!
    var tagModels:[TagModel] = []
    var tagCollectionViewSource = TagCollectionViewSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<100 {
            let t = TagModel()
            t.tag = ["アニメ","ゲーム","漫画","仕事","Bussiness","料理","子供","同人誌","旅行","フィットネスクラブ","資料","大学のレポート"][i%12]
            t.num = [0,100,2000,30,10,5,3,1,2,1000][i%10]
            tagModels.append(t)
        }
        
        menuTableView.delaysContentTouches = false
        menuTableView.canCancelContentTouches = true
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }

}

extension RightMenuViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1000
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: RightMenuTagTableViewCell.self, for: indexPath)
        cell.setup(tagModels: tagModels, tagCollectionViewSource: tagCollectionViewSource)
        return cell
        
//        let cell = tableView.dequeueReusableCell(with: TagTableViewCell.self, for: indexPath)
//        cell.setup(tagModel1: tagModels[0], tagModel2: tagModels[1])
//        cell.selectionStyle = .none
//        return cell
    }
    
    
}
