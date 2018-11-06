//
//  PhotoMemoDetailTagsTableViewCell.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/31.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

// 詳細タグのCell
class PhotoMemoDetailTagsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cellHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(source:TagsCollectionViewSource) {
        
        collectionView.delegate = source
        collectionView.dataSource = source
        collectionView.reloadData()
        
        setupLayout(tagModels: source.tagModels)
    }

    func setupLayout(tagModels:[TagModel]) {
        let layout = TagsCollectionViewLayout()
        
        var cellSizes:[CGSize] = []
//        let dummyCell = PhotoMemoDetailTagCollectionViewCell(frame: self.bounds)
        let dummyCell = collectionView.dequeueReusableCell(with: PhotoMemoDetailTagCollectionViewCell.self, for: IndexPath(row: 0, section: 0))
        
        tagModels.forEach { (tagModel) in
            // cellの期待width
            let expectedCellWidth = tagModel.tag.width(withConstrainedHeight: dummyCell.tagLabel.height,
                                                       font: dummyCell.tagLabel.font)
            // cellの期待Size
            let size = CGSize(width: expectedCellWidth + PhotoMemoDetailTagCollectionViewCell.inset.left + PhotoMemoDetailTagCollectionViewCell.inset.right,
                              height: dummyCell.tagLabel.height + PhotoMemoDetailTagCollectionViewCell.inset.top + PhotoMemoDetailTagCollectionViewCell.inset.bottom)
            print("👺 \(size)")
            cellSizes.append(size)
            
//            // cellの期待width
//            let expectedCellWidth = tagModel.tag.width(withConstrainedHeight: 10,
//                                                       font: UIFont.systemFont(ofSize: 10))
//            // cellの期待Size
//            cellSizes.append(CGSize(width: expectedCellWidth + PhotoMemoDetailTagCollectionViewCell.inset.left + PhotoMemoDetailTagCollectionViewCell.inset.right,
//                                    height: 10 + PhotoMemoDetailTagCollectionViewCell.inset.top + PhotoMemoDetailTagCollectionViewCell.inset.bottom))
        }
        
        layout.setup(cellSizes: cellSizes, collectionViewWidth: collectionView.width, horizontalMargin: 10, verticalMargin: 10, collectionViewInset: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
        
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        collectionView.layoutIfNeeded()
        cellHeight.constant = collectionView.contentSize.height
    }
}

// タグのソース
class TagsCollectionViewSource: NSObject, UICollectionViewDelegate,UICollectionViewDataSource {
    
    var tagModels:[TagModel] = []
    
    func setup(tagModels:[TagModel]) {
        self.tagModels = tagModels
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tagModel = tagModels[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(with: PhotoMemoDetailTagCollectionViewCell.self, for: indexPath)
        cell.tagLabel.text = tagModel.tag
        return cell
    }
    
}
