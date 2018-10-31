//
//  PhotoMemoDetailViewController.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/10.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class PhotoMemoDetailViewController: UIViewController {
    
    enum SectionType {
        case photo
        case tags
        case memo
    }
    let sectionTypes:[SectionType] = [.photo,.tags,.memo]
    var detailSources:[PhotoMemoDetailCollectionViewCellSource] = []
    let layout = UICollectionViewFlowLayout()
    
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        detailCollectionView.register(cellType: PhotoMemoDetailCollectionViewCell.self)
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self

        for i in 0..<100 {
            let source = PhotoMemoDetailCollectionViewCellSource()
            detailSources.append(source)
        }

        self.navigationController?.isNavigationBarHidden = false
        
        setupTagsCell()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layout.itemSize = detailCollectionView.frame.size
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .zero
        
        detailCollectionView.setCollectionViewLayout(layout, animated: false)
        
    
    }
    
    // tagsのcellのsource
    let photoMemoDetailTagsTableViewCellSource = PhotoMemoDetailTagsTableViewCellSource()
    
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
        
        photoMemoDetailTagsTableViewCellSource.setup(tagModels: [t1,t2,t3,t4,t5,t1,t2,t3,t4,t5,])
        
    }
}

// 横
extension PhotoMemoDetailViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: PhotoMemoDetailCollectionViewCell.self, for: indexPath)
        cell.setup(source: detailSources[indexPath.item])
        return cell
    }
    
    
}

// 縦
extension PhotoMemoDetailViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTypes.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 一旦1
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = sectionTypes[indexPath.section]
        
        switch sectionType {
        case .photo:
            let cell = tableView.dequeueReusableCell(with: PhotoMemoDetailPhotoTableViewCell.self, for: indexPath)
            return cell
        case .tags:
            let cell = tableView.dequeueReusableCell(with: PhotoMemoDetailTagsTableViewCell.self, for: indexPath)
            cell.setup(source: photoMemoDetailTagsTableViewCellSource)
            return cell
        case .memo:
            let cell = tableView.dequeueReusableCell(with: PhotoMemoDetailMemoTableViewCell.self, for: indexPath)
            return cell
        }
        
    }
    
}
