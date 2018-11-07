//
//  PhotoMemoDetailCollectionViewCell.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/18.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

// Detail
//   - 横CollectionViewのCell
//       - TableView（1個のDetail）
class PhotoMemoDetailHorizontalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoMemoDetailTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoMemoDetailTableView.contentInset = UIEdgeInsets(top: -100, left: 0, bottom: 0, right: 0)
    }
    
    func setup(source:PhotoMemoDetailTableViewSource) {
        source.setupTagsCell()
        
        photoMemoDetailTableView.rowHeight = UITableViewAutomaticDimension
        photoMemoDetailTableView.estimatedRowHeight = 50

        photoMemoDetailTableView.delegate = source
        photoMemoDetailTableView.dataSource = source        
    }
    
}

class PhotoMemoDetailTableViewSource:NSObject, UITableViewDelegate,UITableViewDataSource {
    
    enum SectionType {
        case photo
        case tags
        case memo
    }
    let sectionTypes:[SectionType] = [.photo,.tags,.memo]
    
    // tagsのcellのsource
    let tagsCollectionViewSource = TagsCollectionViewSource()

    func setupTagsCell() {
        
        // 仮データ
        let t1 = TagModel()
        t1.tag = "あいうえおかきくけこ"
        let t2 = TagModel()
        t2.tag = "アニメ"
        let t3 = TagModel()
        t3.tag = "観光"
        let t4 = TagModel()
        t4.tag = "ビジネス"
        let t5 = TagModel()
        t5.tag = "東京特許許可局許可局長"
        
        tagsCollectionViewSource.setup(tagModels: [t1,t2,t3,t4,t5,t1,t2,t3,t4,t5,])
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTypes.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = sectionTypes[indexPath.section]
        
        print("😚 \(tableView.bounds)")
        
        switch sectionType {
        case .photo:
            let cell = tableView.dequeueReusableCell(with: PhotoMemoDetailPhotoTableViewCell.self, for: indexPath)
            return cell
        case .tags:
            let cell = tableView.dequeueReusableCell(with: PhotoMemoDetailTagsTableViewCell.self, for: indexPath)
            cell.setup(source: tagsCollectionViewSource)
            cell.layoutIfNeeded()
            return cell
        case .memo:
            let cell = tableView.dequeueReusableCell(with: PhotoMemoDetailMemoTableViewCell.self, for: indexPath)
            return cell
        }
        
    }
    
    
}
