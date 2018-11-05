//
//  PhotoMemoDetailViewController.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/10.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class PhotoMemoDetailViewController: UIViewController {

    var detailSources:[DetailTableViewSource] = []
    let layout = UICollectionViewFlowLayout()
    
    @IBOutlet weak var detailCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        detailCollectionView.register(cellType: PhotoMemoDetailCollectionViewCell.self)
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self

        for i in 0..<100 {
            let source = DetailTableViewSource()
            detailSources.append(source)
        }

        self.navigationController?.isNavigationBarHidden = false
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

