//
//  GroupViewController.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/10.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {

    @IBOutlet weak var groupCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupCollectionView.delegate = self
        groupCollectionView.dataSource = self

        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: (self.view.width - 50)/2.0,
                                 height:(self.view.width - 50)/2.0 * 100/130.0 )
        
        groupCollectionView.setCollectionViewLayout(layout, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GroupViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let c = [UIColor.red, UIColor.blue, UIColor.orange, UIColor.green, UIColor.purple, UIColor.gray][indexPath.item % 6]
        let t = ["aaa","bbb","abcdefg","ああああああああいうえお","#メダルアート","ほげ","ヌッ"][indexPath.item % 7]
        
        let cell = collectionView.dequeueReusableCell(with: SampleCell.self, for: indexPath)
//        cell.backgroundColor = c
//        cell.label1.text = t
        
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "PhotoMemoListViewController", sender: nil)
    }
    
}

class SampleCell:UICollectionViewCell {
    @IBOutlet weak var label1: UILabel!
    
}

