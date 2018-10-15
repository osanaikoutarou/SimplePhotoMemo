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

class LeftMenuViewController: UIViewController {

    @IBOutlet weak var menuTableView: MenuTableView!
    var tagModels:[TagModel] = []
    var tagCollectionViewSource = TagCollectionViewSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0..<100 {
            let t = TagModel()
            t.tag = ["アニメ","ゲーム","漫画","仕事","Bussiness","料理","子供","同人誌","旅行","フィットネスクラブ","資料","大学のレポート"][i%12]
            t.num = [0,100,20000,30,10,5,3,1,2,1000][i%10]
            tagModels.append(t)
        }
        
        menuTableView.delaysContentTouches = false
        menuTableView.canCancelContentTouches = true
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }

}

extension LeftMenuViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(with: RightMenuTagTableViewCell.self, for: indexPath)
//        cell.setup(tagModels: tagModels, tagCollectionViewSource: tagCollectionViewSource)
//        return cell
        
        let cell = tableView.dequeueReusableCell(with: TagTableViewCell.self, for: indexPath)
        cell.setup(tagModels[indexPath.row])
//        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
