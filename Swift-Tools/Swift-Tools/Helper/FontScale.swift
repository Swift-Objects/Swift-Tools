//
//  FontScale.swift
//  Swift-Tools
//
//  Created by lemo on 2018/10/29.
//  Copyright © 2018年 wangli. All rights reserved.
//

import UIKit

// 使用时,在 APPDelegate 类的 didFinishLaunchingWithOptions方法里面 添加 UILabel.appearance().defaultFont = UIFont.systemFont(ofSize: 25),
extension UILabel {
    @objc var defaultFont: UIFont? {
        get { return self.font }
        set {
            if self.tag == 0 {
                self.tag = 1
                let newFontSize = self.font.pointSize
                let oldFontName = self.font.fontName
                self.font = UIFont(name: oldFontName, size: newFontSize)
            }
        }
    }
}


