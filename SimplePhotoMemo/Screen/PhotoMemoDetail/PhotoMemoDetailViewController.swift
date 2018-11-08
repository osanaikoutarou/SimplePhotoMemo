//
//  PhotoMemoDetailViewController.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/10.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit
import ImageViewer

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
        self.view.updateConstraint(identifier: "top", value: -self.navigationBarHeight)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MyNotificationCenter.shared.add(observer: .showImageViewer) { (sender:Any?) in
            print("きたよ！🐭")
            // Show the ImageViewer with with the first item
            self.presentImageGallery(GalleryViewController(startIndex: 0, itemsDataSource: self))
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        MyNotificationCenter.shared.remove(observer: .showImageViewer)
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


// The GalleryItemsDataSource provides the items to show
extension PhotoMemoDetailViewController: GalleryItemsDataSource {
    func itemCount() -> Int {
        return 1
    }
    
    func provideGalleryItem(_ index: Int) -> GalleryItem {
        let item:GalleryItem = GalleryItem.image { $0(UIImage(named: "huukei1")) }
        return item
    }
}
