//
//  CollectionViewController.swift
//  Swift-Tools
//
//  Created by lemo on 2018/6/4.
//  Copyright © 2018年 wangli. All rights reserved.
//

import UIKit

class CollectionViewController: BQSMainViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let identifier = "CollectionViewCell"
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .orange
        addCollectionView()
    }
    
    func addCollectionView() {
        let left: CGFloat = 3
        let spacing: CGFloat = 3
        let number: Int = 3
        let width = (self.view.frame.width - left * 2 - CGFloat(number - 1) * spacing) / CGFloat(number)
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: left, bottom: 0, right: left)
        layout.itemSize = CGSize(width: width, height: width)
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        let nib = UINib(nibName: identifier, bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: identifier)
        self.view.addSubview(collectionView!)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 23
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("点击:\(indexPath)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
