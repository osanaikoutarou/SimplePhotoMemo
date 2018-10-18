//
//  PhotoMemoDetailCollectionViewCell.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/18.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class PhotoMemoDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tableView.register(cellType: PhotoMemoDetailMemoTableViewCell.self)
        tableView.register(cellType: PhotoMemoDetailPhotoTableViewCell.self)
        
    }
    
    func setup(source:PhotoMemoDetailCollectionViewCellSource) {
        tableView.delegate = source
        tableView.dataSource = source
    }

}

class PhotoMemoDetailCollectionViewCellSource:NSObject, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(with: PhotoMemoDetailPhotoTableViewCell.self, for: indexPath)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(with: PhotoMemoDetailMemoTableViewCell.self, for: indexPath)
        return cell
        
    }
    
    
}
