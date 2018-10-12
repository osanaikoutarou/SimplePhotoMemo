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
        
        layout.itemSize = CGSize(width:160, height: 100)
        
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
        
        
        
        return cell
    }
    
}

class SampleCell:UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        img.corner(radius: 5)

        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1.0/UIScreen.main.scale

        containerView.addBelowShadowView(shadowColor: .black,
                                         shadowOffset: CGSize(width: 2, height: 2),
                                         shadowOpacity: 0.15,
                                         shadowRadius: 1.0)
        
    }
    
}

