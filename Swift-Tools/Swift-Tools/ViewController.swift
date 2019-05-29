//
//  ViewController.swift
//  Swift-Tools
//
//  Created by lemo on 2018/6/4.
//  Copyright © 2018年 wangli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        
    }
    
    @IBAction func addCollectionView(_ sender: Any) {
        let collectionView = CollectionViewController()
        self.navigationController?.pushViewController(collectionView, animated: true)
    }
    
    @IBAction func horizontalScrollCollectionView(_ sender: Any) {
        let Horizontal = HorizontalCollectionViewController()
        self.navigationController?.pushViewController(Horizontal, animated: true)
    }
    
    @IBAction func tableView(_ sender: Any) {
        let tableView = TableController()
        self.navigationController?.pushViewController(tableView, animated: true)
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

