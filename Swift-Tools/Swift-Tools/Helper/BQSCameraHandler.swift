//
//  BQSCaneraHandler.swift
//  FaceStore-Swift
//
//  Created by lemo on 2018/4/26.
//  Copyright © 2018年 wangli. All rights reserved.
//  调用相机-打开相册

import UIKit

class BQSCameraHandler: NSObject {
    
    static let shared = BQSCameraHandler()
    
    fileprivate var currentVC: UIViewController!
    
    var imagePickedBlock: ((UIImage) -> Void)?
    
    //打开相机
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .camera
            currentVC.present(pickerController, animated: true, completion: nil)
            
        } else {
            
        }
    }
    
    //打开相册
    func openPhoteLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .photoLibrary
            currentVC.present(pickerController, animated: true, completion: nil)
        }
        
    }
    
    //提示
    func showAlertController() {
        let alert = UIAlertController(title: "错误", message: "设备不支持相机", preferredStyle: UIAlertControllerStyle.actionSheet)
        let action = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alert.addAction(action)
        self.currentVC.present(alert, animated: true, completion: nil)
    }
    
    //选择相机或者相册
    func showCameraAndPhotoLibrary(vc: UIViewController) {
        currentVC = vc
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "打开相机", style: .default) { (alertAction: UIAlertAction) in
            self.openCamera()
        }
        let photoLibrary = UIAlertAction(title: "打开相册", style: .default) { (alertAction: UIAlertAction) in
            self.openPhoteLibrary()
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alert.addAction(camera)
        alert.addAction(photoLibrary)
        alert.addAction(cancel)
        vc.present(alert, animated: true, completion: nil)
    }
    
}


extension BQSCameraHandler: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        currentVC.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imagePickedBlock!(image)
        } else {
            print("something went wrong")
        }
        currentVC.dismiss(animated: true, completion: nil)
    }
}
