//
//  ViewController.swift
//  Swift-Tools
//
//  Created by lemo on 2018/6/4.
//  Copyright © 2018年 wangli. All rights reserved.
//

import UIKit

class ViewController: BQSMainViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func addCollectionView(_ sender: Any) {
        collectionViewController()
    }
    
    @IBAction func horizontalScrollCollectionView(_ sender: Any) {
        horizontalCollectionViewController()
    }
    
    @IBAction func tableView(_ sender: Any) {
        tableController()
    }
    
    @IBAction func SelectImageOrVideo(_ sender: UIButton) {
        BQSCameraHandler.shared.showCameraAndPhotoLibrary(vc: self)
        BQSCameraHandler.shared.imagePickedBlock = {(image) in
            print("选择图片")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //
    }


}

