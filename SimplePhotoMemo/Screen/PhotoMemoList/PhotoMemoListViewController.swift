//
//  PhotoMemoListViewController.swift
//  SimplePhotoMemo
//
//  Created by osanai on 2018/10/09.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class PhotoMemoListViewController: UIViewController {

    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var subInformationLabel: UILabel!
    @IBOutlet weak var memoLabel: LineSpacingLabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTableView.delegate = self
        itemTableView.dataSource = self
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func tappedAddButton(_ sender: Any) {
        self.performSegue(withIdentifier: "AddPhotoMemo", sender: nil)
    }
}

extension PhotoMemoListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: PhotoMemoListTableViewCell.self, for: indexPath)
        return cell
    }
}


