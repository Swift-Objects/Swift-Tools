//
//  VerticalScrollLayout.swift
//  Swift-Tools
//
//  Created by lemo on 2018/6/4.
//  Copyright © 2018年 wangli. All rights reserved.
//

import UIKit

class HorizontalScrollLayout: UICollectionViewFlowLayout {
    var attributes: [UICollectionViewLayoutAttributes] = []
//    var pageNumber: Int? //每个分区的页数
    var lineNumber: Int? //每行的个数
    var rowNumber: Int?  //每列的个数
    var currentPage = 0
    override func prepare() {
        super.prepare()
        let count = self.collectionView?.numberOfItems(inSection: 0)
        for num in 0...count! - 1 {
            let index = IndexPath(row: num, section: 0)
            let attribute = self.layoutAttributesForItem(at: index)
            self.attributes.append(attribute!)
        }
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: CGFloat(currentPage) * (self.collectionView?.frame.size.width)!, height: self.collectionView!.contentSize.height)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attribute = super.layoutAttributesForItem(at: indexPath)!
        if attribute.representedElementKind == nil {
            let itemWidth = attribute.frame.width
            let itemHeight = attribute.frame.height
            
            let page = indexPath.row / (lineNumber! * rowNumber!)
            let remainder = indexPath.row % (lineNumber! * rowNumber!)
            //page根据不同的分区,加上之前的分区的页数
            let X = 3 + (3 + itemWidth) * CGFloat(remainder % rowNumber!) + CGFloat(page) * ScreenWidth
            let Y = 3 + (3 + itemHeight) * CGFloat(remainder / rowNumber!)
            attribute.frame = CGRect(x: X, y: Y, width: itemWidth, height: itemHeight)
            currentPage = page
        }
        return attribute
    }
}
