//
//  AddPhotoMemoViewController.swift
//  SimplePhotoMemo
//
//  Created by 長内幸太郎 on 2018/10/10.
//  Copyright © 2018年 osanai. All rights reserved.
//

import UIKit

class AddPhotoMemoViewController: UIViewController {

    @IBOutlet weak var sendImageView: UIImageView!
    @IBOutlet weak var inputViewsBottom: NSLayoutConstraint!
    var imagePickerDelegateController = ImagePickerDelegateController()
    var keyboardController = KeyboardController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addCloseButton()
        setupKeyboard()
    }
    
    func setupKeyboard() {
        keyboardController.setup(type: .custom)
        
        keyboardController.setupKeyboardNotification()
        
        keyboardController.keyboardWillShowClosureEx = { (notification, duration, curve, keyboardFrame) in
            if let keyboadFrame = keyboardFrame {
                self.inputViewsBottom.constant = keyboadFrame.size.height - (self.tabBarController?.tabBar.height)!
                
                UIView.animate(withDuration: duration!,
                               delay: 0,
                               options: [UIViewAnimationOptions.curveWithInt(curve ?? 0)],
                               animations: {
                                self.view.layoutIfNeeded()
                }, completion: nil)
            }
        }
        keyboardController.keyboardWillHideClosureEx = { (notification, duration, curve, keyboardFrame) in
            self.inputViewsBottom.constant = 0
            UIView.animate(withDuration: duration!,
                           delay: 0,
                           options: [UIViewAnimationOptions.curveWithInt(curve ?? 0)],
                           animations: {
                            self.view.layoutIfNeeded()
            }, completion: nil)
            
        }
        
        

        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func tappedView() {
        self.view.endEditing(true)
    }
    
    @IBAction func tappedAddImageButton(_ sender: Any) {
        self.showImagePicker { (image:UIImage?, type:String?, url:URL?) in
            self.sendImageView.image = image
        }
    }
    

}

extension AddPhotoMemoViewController {
    func showImagePicker(didSelectImage:@escaping ((_ image:UIImage?, _ type:String?, _ url:URL?) -> ())) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self.imagePickerDelegateController
        self.imagePickerDelegateController.didSelectImage = { (image,type,url) in
            didSelectImage(image,type,url)
            imagePicker.dismiss(animated: true, completion: nil)
        }
        self.imagePickerDelegateController.didCancel = { () in
            imagePicker.dismiss(animated: true, completion: nil)
        }
        present(imagePicker, animated: true)
    }
}


class ImagePickerDelegateController:NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var didCancel:(() -> ())?
    var didSelectImage:((_ image:UIImage?, _ type:String?, _ url:URL?) -> ())?
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // キャンセルボタンを押された時に呼ばれる
        if let didCancel = didCancel {
            didCancel()
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 写真が選択された時に呼ばれる
        if let didSelectImage = didSelectImage {
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            let imageUrl = info[UIImagePickerControllerImageURL] as? URL
            let mediaType = info[UIImagePickerControllerMediaType] as? String
            
            didSelectImage(image, mediaType, imageUrl)
        }
    }
    
}


