//
//  PhotoMemoListViewController.swift
//  SimplePhotoMemo
//
//  Created by osanai on 2018/10/09.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit
import AMScrollingNavbar

class PhotoMemoListViewController: UIViewController {

    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var itemCollectioinView: UICollectionView!
    @IBOutlet weak var addButton: ButtonView!
    
    @IBOutlet weak var layoutButton3: ButtonView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemCollectioinView.delegate = self
        itemCollectioinView.dataSource = self
//        itemTableView.delegate = self
//        itemTableView.dataSource = self
        
//        self.navigationController?.hidesBarsOnSwipe = true
        
        layoutButton3.circle()
        layoutButton3.setup(type: .darkerTheWhole)
        
        addMenuButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let navigationController = navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(self.itemTableView, delay: 100.0)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let navigationController = navigationController as? ScrollingNavigationController {
            navigationController.stopFollowingScrollView()
        }
    }
    
    @IBAction func tappedAddButton(_ sender: Any) {
        self.performSegue(withIdentifier: "AddPhotoMemo", sender: nil)
    }
}

extension PhotoMemoListViewController {
    // prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "PhotoMemoDetail") {
            let vc = segue.destination as! PhotoMemoDetailViewController
            vc.hidesBottomBarWhenPushed = true
            vc.navigationController?.hidesBarsOnSwipe = true
        }
    }
}

extension PhotoMemoListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return LargePhotoMemoListCollectionViewCell.cellSize
//        return NormalPhotoMemoListCollectionViewCell.cellSize
        return PhotoThreePhotoMemoListCollectionViewCell.cellSize
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension PhotoMemoListViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(with: LargePhotoMemoListCollectionViewCell.self, for: indexPath)
//        let cell = collectionView.dequeueReusableCell(with: NormalPhotoMemoListCollectionViewCell.self, for: indexPath)
        let cell = collectionView.dequeueReusableCell(with: PhotoThreePhotoMemoListCollectionViewCell.self, for: indexPath)
        cell.setup(photoMemo: PhotoMemo())
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "PhotoMemoDetail", sender: nil)
    }
}

//extension PhotoMemoListViewController: UITableViewDelegate,UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(with: PhotoMemoListTableViewCell.self, for: indexPath)
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        self.performSegue(withIdentifier: "PhotoMemoDetail", sender: nil)
//    }
//
////    func scrollViewDidScroll(_ scrollView: UIScrollView) {
////        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
////            navigationController?.setNavigationBarHidden(true, animated: true)
////        } else {
////            navigationController?.setNavigationBarHidden(false, animated: true)
////        }
////    }
//
//}


