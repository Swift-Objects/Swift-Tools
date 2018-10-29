//
//  BQSConst.swift
//  FaceStore-Swift
//
//  Created by lemo on 2018/4/19.
//  Copyright © 2018年 wangli. All rights reserved.
//  宏定义存放位置

import UIKit

//MARK: 主色调-白色
let BQSWhiteColor = UIColor.white
//MARK: 屏幕宽度
let BQSScreenWidth = UIScreen.main.bounds.width
//MARK: 屏幕高度
let BQSScreenHeight = UIScreen.main.bounds.height
//MARK: 导航栏高度
//let BSWNavigationHHeight = self.navigationController.navigationBar.frame.size.height
//MARK: UserDefaults
let BQSUserDefaults = UserDefaults.standard
//MARK: BWSFaceStoreUserId
let BWSFaceStoreUserId = BQSUserDefaults.object(forKey: "FaceUserid")
//MARK: BQWAppThemeColor
let BQSAppThemeColor = UIColor.init(hex: "#999999")

//MARK: ------------------ 手机型号判断 -----------------------
let IPHONE_4_HEIGHT: CGFloat = 480
let IPHONE_5_HEIGHT: CGFloat = 568
let IPHONE_6_HEIGHT: CGFloat = 667
let IPHONE_6P_HEIGHT: CGFloat = 736
let IPHONE_X_HEIGHT: CGFloat  = 812

let IPHONE_4_WIDTH: CGFloat = 320
let IPHONE_5_WIDTH: CGFloat = 320
let IPHONE_6_WIDTH: CGFloat = 375
let IPHONE_6P_WIDTH: CGFloat = 414
let IPHONE_X_WIDTH : CGFloat = 375

//4-4S
let IS_IPHONE_4 = BQSScreenHeight == 480
//5-5S-SE
let IS_IPHONE_5 = BQSScreenHeight == 568
//6-6S-7-8
let IS_IPHONE_6 = BQSScreenHeight == 667
//6P-6sP-7P-8P
let IS_IPHONE_6P = BQSScreenHeight == 736
//X
let IS_IPHONE_X = BQSScreenHeight == 812
//与6的尺寸比例
let WIDTH_SCALE = BQSScreenWidth / 375
let HEIGHT_SCALE = BQSScreenHeight / 667

//宽度适配
func fitWidth(width: CGFloat) -> CGFloat { return width * WIDTH_SCALE }
//高度适配
func fitHeight(height: CGFloat) -> CGFloat { return height * HEIGHT_SCALE }

//字体大小适配
func fontSize(size: CGFloat) -> CGFloat {
    switch BQSScreenHeight {
    case 480: //4-4S
        return size
    case 568: //5-5S-SE
        return size
    case 736: //6P-6sP-7P-8P
        return size + 2
    case 812: //X
        return size + 4
    default: //6-6S-7-8
        return size
    }
}

//userId
var UserId = "666"



//MARK: ----------------- 文件路径 -----------------
let documentPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!







