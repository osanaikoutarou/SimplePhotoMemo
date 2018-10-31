//
//  PhotoMemoDetailTagsTableViewCell.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/31.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class PhotoMemoDetailTagsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()        
    }
    
    func setup(source:PhotoMemoDetailTagsTableViewCellSource) {
        setupLayout(tagModels: source.tagModels)
        
        collectionView.delegate = source
        collectionView.dataSource = source
        collectionView.reloadData()
    }

    func setupLayout(tagModels:[TagModel]) {
        let layout = TagsCollectionViewLayout()
        
        var cellSizes:[CGSize] = []
        let dummyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoMemoDetailTagCollectionViewCell", for: IndexPath(row: 0, section: 0)) as! PhotoMemoDetailTagCollectionViewCell
        
        tagModels.forEach { (tagModel) in
            // cellの期待width
            let expectedCellWidth = tagModel.tag.width(withConstrainedHeight: dummyCell.tagLabel.height,
                                                       font: dummyCell.tagLabel.font)
            // cellの期待Size
            cellSizes.append(CGSize(width: expectedCellWidth + PhotoMemoDetailTagCollectionViewCell.inset.left + PhotoMemoDetailTagCollectionViewCell.inset.right,
                                    height: dummyCell.tagLabel.height + PhotoMemoDetailTagCollectionViewCell.inset.top + PhotoMemoDetailTagCollectionViewCell.inset.bottom))
        }
        
        layout.setup(cellSizes: cellSizes, collectionViewWidth: collectionView.width, horizontalMargin: 10, verticalMargin: 10, collectionViewInset: UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15))
        
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
}

class PhotoMemoDetailTagsTableViewCellSource: NSObject, UICollectionViewDelegate,UICollectionViewDataSource {
    
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
