//
//  PhotoMemoDetailViewController.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/10.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class PhotoMemoDetailViewController: UIViewController {
    
    enum CellType {
        case photo
        case memo
    }
    let cellTypes:[CellType] = [.photo,.memo]
    
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        self.navigationController?.isNavigationBarHidden = false
    
    }
}



extension PhotoMemoDetailViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellTypes[indexPath.row]
        
        switch cellType {
        case .photo:
            let cell = tableView.dequeueReusableCell(with: PhotoMemoDetailPhotoTableViewCell.self, for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(with: PhotoMemoDetailMemoTableViewCell.self, for: indexPath)
            return cell
        }
        
    }
    
}
