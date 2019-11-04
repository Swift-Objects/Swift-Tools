//
//  BQSCaneraHandler.swift
//  FaceStore-Swift
//
//  Created by lemo on 2018/4/26.
//  Copyright © 2018年 wangli. All rights reserved.
//  调用相机-打开相册

import UIKit
import MobileCoreServices
import AVKit

class BQSCameraHandler: NSObject {
    
    static let shared = BQSCameraHandler()
    
    fileprivate var currentVC: UIViewController!
    
    var imagePickedBlock: ((UIImage) -> Void)?
    
    //打开相机
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .camera
            currentVC.present(pickerController, animated: true, completion: nil)
            
        } else {
            
        }
    }
    
    //打开相册
    func openPhoteLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .photoLibrary
            currentVC.present(pickerController, animated: true, completion: nil)
        }
    }
    
    //选择视频
    func selectVideo() {
        //        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.mediaTypes = [kUTTypeMovie as String]
        imagePicker.delegate = self
        currentVC?.present(imagePicker, animated: true, completion: nil)
        //        }
    }
    
    //提示
    func showAlertController() {
        let alert = UIAlertController(title: "错误", message: "设备不支持相机", preferredStyle: UIAlertController.Style.actionSheet)
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
        
        let videoLibrary = UIAlertAction(title: "选取视频", style: .default) { (alertAction: UIAlertAction) in
            self.selectVideo()
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alert.addAction(camera)
        alert.addAction(photoLibrary)
        alert.addAction(videoLibrary)
        alert.addAction(cancel)
        vc.present(alert, animated: true, completion: nil)
    }
    
}


extension BQSCameraHandler: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        currentVC.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        
        // 判断是图片还是视频
        let mediaType = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.mediaType)] as! [String]
        if mediaType == [kUTTypeVideo as String] {
            // 视频
            if let url = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.mediaURL)] as? URL {
                //播放
                let play = AVPlayer(url: url)
                let playController = AVPlayerViewController()
                playController.player = play
                currentVC.present(playController, animated: true) {
                    playController.player?.play()
                }
            }
        } else { //图片
            if let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage {
                self.imagePickedBlock!(image)
            } else {
                print("something went wrong")
            }
        }
        currentVC.dismiss(animated: true, completion: nil)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}
