//
//  SandboxViewController.swift
//  SimplePhotoMemo
//
//  Created by osanai on 2018/10/15.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class SandboxViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self        
    }

}

extension SandboxViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: SandboxCollectionViewCell1.self, for: indexPath)
        return cell
    }

    // タッチが始まる時
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        let cell = collectionView.cellForItem(at: indexPath) as! SandboxCollectionViewCell1
        cell.label1.text = "🤔should HighlightItemAt"
        print("🤔should HighlightItemAt")
        return true
    }
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SandboxCollectionViewCell1
        cell.label1.text = "😃did HighlightItemAt"
        cell.label1.superview!.backgroundColor = .green
        print("😃did HighlightItemAt")
    }
    // タッチが上がった時
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let cell = collectionView.cellForItem(at: indexPath) as! SandboxCollectionViewCell1
        cell.label1.text = "🤔should SelectItemAt"
        print("🤔should SelectItemAt")
        return true
    }
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SandboxCollectionViewCell1
        cell.label1.text = "☹️did SelectItemAt"
        cell.label1.superview!.backgroundColor = .cyan
        print("☹️did SelectItemAt")
    }
    
}

class SandboxCollectionViewCell1:UICollectionViewCell {
    
    @IBOutlet weak var label1: UILabel!
    
}
