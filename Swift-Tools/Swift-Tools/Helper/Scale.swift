//
//  Scale.swift
//  Swift-Tools
//
//  Created by lemo on 2018/10/29.
//  Copyright © 2018年 wangli. All rights reserved.
//  与 iphone6的对应的宽度(写了 Int, CGFloat, Double 三种数据类型的扩展,为了书写方便)

import UIKit

extension CGFloat {
    
    /**
     //使用方法
     let someView = UIView(frame: CGRect(x: 0, y: 0, width: 320.dp, height: 40.dp)
     
     **Warning** Only works with size references from @1x mockups.
     
     */
    
    // 与 iPhone 6对应的宽度
    var dp: CGFloat {
        return (self / 375) * UIScreen.main.bounds.width
    }
    
    // 与 iPhone 6对应的宽度(返回的是整型大小的小数)
    var dpInt: CGFloat {
        return CGFloat(roundf(Float(self.dp)))
    }
    
}

extension Int {
    // 与 iPhone 6对应的宽度
    var dp: CGFloat {
        return (CGFloat(self) / 375.0) * UIScreen.main.bounds.width
    }
    
    // 与 iPhone 6对应的宽度(返回的是整型大小的小数)
    var dpInt: CGFloat {
        return CGFloat(roundf(Float(self.dp)))
    }
}

extension Double {
    // 与 iPhone 6对应的宽度
    var dp: CGFloat {
        return CGFloat(self / 375.0) * UIScreen.main.bounds.width
    }
    
    // 与 iPhone 6对应的宽度(返回的是整型大小的小数)
    var dpInt: CGFloat {
        return CGFloat(roundf(Float(self.dp)))
    }
}
