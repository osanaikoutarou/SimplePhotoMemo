//
//  RightMenuTagTableViewCell.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/14.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class TagCollectionView: UICollectionView {
    override func touchesShouldCancel(in view: UIView) -> Bool {
        return false
    }
}

class RightMenuTagTableViewCell: UITableViewCell {

    @IBOutlet weak var tagCollectionView: TagCollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tagCollectionView.delaysContentTouches = false
        tagCollectionView.canCancelContentTouches = true
    }

    func setup(tagModels:[TagModel], tagCollectionViewSource:TagCollectionViewSource) {
        tagCollectionViewSource.setup(tagModels: tagModels, collectionView: tagCollectionView)
        
        tagCollectionView.reloadData()
    }
}

class TagCollectionViewSource: NSObject,UICollectionViewDelegate,UICollectionViewDataSource {
    var layout = TagsCollectionViewLayout()
    var tagModels:[TagModel] = []
    var font:UIFont! = UIFont(name: "HiraginoSans-W3", size: 16)
    var collectionView:UICollectionView!
    
    func setup(tagModels:[TagModel], collectionView:UICollectionView) {
        self.tagModels = tagModels
        self.collectionView = collectionView
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        var sizes:[CGSize] = []
        tagModels.forEach { (tagModel) in
//            let width = tagModel.tag.width(withConstrainedHeight: font.pointSize + 1.0, font: font)
//            print("\(tagModel.tag) : \(width)")
//            let size = CGSize(width: width + 4*2, // マージン
//                              height: font.pointSize + 1.0 + 4*2)
            let size = CGSize(width: (BaseSlideMenuViewController.rightMenuWidth - 60)/2.0, height: font.pointSize + 1.0 + 8*2)
            sizes.append(size)
        }
        
        layout.setup(cellSizes: sizes,
                     collectionViewWidth: BaseSlideMenuViewController.rightMenuWidth,
                     horizontalMargin: 12,
                     verticalMargin: 12,
                     collectionViewInset: UIEdgeInsetsMake(0, 15, 10, 15))

        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tagModel = tagModels[indexPath.item]
        let cell = collectionView.dequeueReusableCell(with: TagCollectionViewCell.self, for: indexPath)
        cell.setup(tagModel)
        return cell
    }
    
//
//    - (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
//    {
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    cell.contentView.backgroundColor = [UIColor greenColor];
//    }
//    to this:
//
//    - (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
//    {
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    cell.contentView.backgroundColor = [UIColor greenColor];
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.contentView.backgroundColor = .lightGray
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.contentView.backgroundColor = .green
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//    }
    
}
