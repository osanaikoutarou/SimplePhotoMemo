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

    override func viewDidLoad() {
        super.viewDidLoad()
        itemTableView.delegate = self
        itemTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
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
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: "PhotoMemoDetail", sender: nil)
    }
}


