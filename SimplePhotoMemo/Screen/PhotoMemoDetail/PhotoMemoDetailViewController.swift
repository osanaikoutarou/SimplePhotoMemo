//
//  PhotoMemoDetailViewController.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/10.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class PhotoMemoDetailViewController: UIViewController {

    var detailSources:[PhotoMemoDetailTableViewSource] = []
    let horizontalCollectionViewLayout = UICollectionViewFlowLayout()
    @IBOutlet weak var detailHorizontalCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailHorizontalCollectionView.delegate = self
        detailHorizontalCollectionView.dataSource = self

        for i in 0..<100 {
            let source = PhotoMemoDetailTableViewSource()
            detailSources.append(source)
        }

        self.navigationController?.isNavigationBarHidden = false
        
        setupNavColors()
        setupNavPosition()
    }
    
    func setupNavColors() {
//        var alpha = 1.0 - (100 - scrollView.contentOffset.y)/100.0 - 0.5
//        alpha = min(0.9, alpha)
//        alpha = max(0, alpha)
        let alpha:CGFloat = 0
        
        let color = UIColor(white: 1, alpha: alpha)
        let colorS = CocoaColors.NavigationBar.shadowColor.withAlphaComponent(alpha)
        self.setNavigationBarColor(navBarColor: color, shadowColor: colorS)
    }
    
    func setupNavPosition() {
        self.view.updateConstraint(identifier: "top", value: -self.topBarAllHeight)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupLayout()
        detailHorizontalCollectionView.reloadData()
    }
    
    func setupLayout() {
        self.view.layoutSubviews()
        horizontalCollectionViewLayout.itemSize = detailHorizontalCollectionView.frame.size
        print("😑 \(detailHorizontalCollectionView.frame)")
        horizontalCollectionViewLayout.scrollDirection = .horizontal
        horizontalCollectionViewLayout.minimumLineSpacing = 0
        horizontalCollectionViewLayout.minimumInteritemSpacing = 0
        horizontalCollectionViewLayout.sectionInset = .zero
        
        detailHorizontalCollectionView.setCollectionViewLayout(horizontalCollectionViewLayout, animated: false)
    }
        
}

// 横
extension PhotoMemoDetailViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: PhotoMemoDetailHorizontalCollectionViewCell.self, for: indexPath)
        cell.layoutIfNeeded()
        cell.setup(source: detailSources[indexPath.item])
        return cell
    }
    
}

