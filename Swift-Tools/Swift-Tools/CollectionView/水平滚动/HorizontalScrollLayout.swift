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
    var left: CGFloat?
    var spacing: CGFloat?
    var top: CGFloat?
    var currentPage = 0
    var width: CGFloat?
    var number: Int = 0
    
    override func prepare() {
        let count = self.collectionView?.numberOfItems(inSection: 0)
        for num in 0...count! - 1 {
            let index = IndexPath(row: num, section: 0)
            let attribute = self.layoutAttributesForItem(at: index)
            self.attributes.append(attribute!)
            
        }
        super.prepare()
    }
    
    override var collectionViewContentSize: CGSize {
        let remainder = number % rowNumber!
        if (currentPage == number / rowNumber!) && remainder != 0  { // 最后一页不是全页
            let hh = left! * 2.0 + CGFloat(remainder) * width!
            let hh1 = spacing! * CGFloat(remainder - 1)
            return CGSize(width: CGFloat(currentPage) * (self.collectionView?.frame.size.width)! + hh + hh1, height: self.collectionView!.contentSize.height)

        }
        return CGSize(width: CGFloat(currentPage) * (self.collectionView?.frame.size.width)!, height: self.collectionView!.contentSize.height)

    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attribute = super.layoutAttributesForItem(at: indexPath)!
        let attributeCopy = attribute.copy() as! UICollectionViewLayoutAttributes
        if attributeCopy.representedElementKind == nil {
            let itemWidth = attributeCopy.frame.width
            let itemHeight = attributeCopy.frame.height
            
            let page = indexPath.row / (lineNumber! * rowNumber!)
            let remainder = indexPath.row % rowNumber!
            //page根据不同的分区,加上之前的分区的页数
            let pageHH = CGFloat(page) * BQSScreenWidth
            let hhh2 = (spacing! + itemWidth)
            let hhh3 = CGFloat(remainder)
            let hhh = hhh2 * hhh3
            let X = left! * CGFloat(page + 2) + hhh + pageHH
            let Y = 3 + (3 + itemHeight) * CGFloat(remainder / rowNumber!)
            attributeCopy.frame = CGRect(x: X, y: Y, width: itemWidth, height: itemHeight)
            currentPage = page
        }
        return attributeCopy
    }
}
