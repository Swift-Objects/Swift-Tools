//
//  CollectionViewController1.swift
//  Swift-Tools
//
//  Created by lemo on 2018/6/4.
//  Copyright © 2018年 wangli. All rights reserved.
//

import UIKit

let collectionViewWidth = UIScreen.main.bounds.width - 21
let ScreenHeight = UIScreen.main.bounds.height

class HorizontalCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let identifier = "CollectionViewCell"
    var collectionView: UICollectionView?
    let number: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .orange
        
        addCollectionView()
    }
    
    func addCollectionView() {
        
        let left: CGFloat = 5.5
        let spacing: CGFloat = 11
        let top: CGFloat = 3
        let rowNumber: Int = 3
        let lineNumber: Int = 1
        let width = (collectionViewWidth - left * 2 - CGFloat(rowNumber - 1) * spacing) / CGFloat(rowNumber)
        let layout = HorizontalScrollLayout()
        
        layout.rowNumber = rowNumber
        layout.lineNumber = lineNumber
        layout.left = left
        layout.spacing = spacing
        layout.top = top
        layout.width = width
        layout.number = number
        
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: left, bottom: 0, right: left)
        layout.itemSize = CGSize(width: width, height: width * 0.5)
        collectionView = UICollectionView(frame: CGRect(x: 10.5, y: 100, width: collectionViewWidth, height: width + 6), collectionViewLayout: layout)
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.isPagingEnabled = true
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
        return number
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("点击:\(indexPath)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
