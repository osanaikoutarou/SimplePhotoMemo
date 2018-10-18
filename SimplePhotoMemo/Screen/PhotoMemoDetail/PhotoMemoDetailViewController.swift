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
    var detailSources:[PhotoMemoDetailCollectionViewCellSource] = []
    let layout = UICollectionViewFlowLayout()
    
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailCollectionView.register(cellType: PhotoMemoDetailCollectionViewCell.self)
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        
        layout.itemSize = self.view.bounds.size
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .zero
        
        detailCollectionView.setCollectionViewLayout(layout, animated: false)
        
        self.navigationController?.isNavigationBarHidden = false
    
        for i in 0..<100 {
            let source = PhotoMemoDetailCollectionViewCellSource()
            detailSources.append(source)
        }
    }
}

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
