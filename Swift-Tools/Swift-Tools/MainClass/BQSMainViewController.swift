//
//  BQSMainViewController.swift
//  FaceStore-Swift
//
//  Created by lemo on 2018/4/19.
//  Copyright © 2018年 wangli. All rights reserved.
//

import UIKit

class BQSMainViewController: UIViewController {
    let mainColor = UIColor.white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //背景色-导航栏背景色-状态栏字体色
        self.view.backgroundColor = mainColor
        self.navigationController?.navigationBar.barTintColor = .black
        UIApplication.shared.statusBarStyle = .lightContent
        setNavigationItemTitleWithColor(color: mainColor)
    }
    // MARK:--------------系统的导航栏按钮添加文字或者图片-----------------
    //MARK:左导航栏按钮添加图片
    func addLeftBarButtonItemWithImage(image: UIImage) {
        let leftItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(leftBarButtonItemAction(item:)))
        self.navigationItem.leftBarButtonItem = leftItem
        setLeftBarButtonItemWithColor(color: mainColor)
    }
    //MARK:左导航栏按钮添加标题
    func addLeftBarButtonItemWithTitle(title: String) {
        let leftItem = UIBarButtonItem(title: title, style: .done, target: self, action: #selector(leftBarButtonItemAction(item:)))
        self.navigationItem.leftBarButtonItem = leftItem
        setLeftBarButtonItemWithColor(color: mainColor)
    }
    //MARK:左导航栏按钮点击事件
    @objc func leftBarButtonItemAction(item: UIBarButtonItem) {
        print("左导航栏按钮点击事件")
    }
    
    //MARK:右导航栏按钮添加图片
    func addRightBarButtonItemWithImage(image: UIImage) {
        let rightItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(rightBarButtonItemAction(item:)))
        self.navigationItem.rightBarButtonItem = rightItem
        setRightBarButtonItemWithColor(color: mainColor)
    }
    //MARK:右导航栏按钮添加标题
    func addRightBarButtonItemWithTitle(title: String) {
        let rightItem = UIBarButtonItem(title: title, style: .done, target: self, action: #selector(rightBarButtonItemAction(item:)))
        self.navigationItem.rightBarButtonItem = rightItem
        setRightBarButtonItemWithColor(color: mainColor)
    }
    //MARK:右导航栏按钮点击事件
    @objc func rightBarButtonItemAction(item: UIBarButtonItem) {
        print("右导航栏按钮点击事件")
    }
    
    //MARK:设置左导航栏颜色
    func setLeftBarButtonItemWithColor(color: UIColor) {
        self.navigationItem.leftBarButtonItem?.tintColor = color
    }
    //MARK:设置右导航栏颜色
    func setRightBarButtonItemWithColor(color: UIColor) {
        self.navigationItem.rightBarButtonItem?.tintColor = color
    }
    //MARK:设置导航栏title颜色
    func setNavigationItemTitleWithColor(color: UIColor) {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: color]
    }
    
    //MARK: -------------------自定义导航栏大小-------------------------
    //MARK:设置规定大小的title
    func addNavigationTitle(font: UIFont, title: String) {
        let titleLabel = addLabelTitleAndFont(title: title, font: font)
        self.navigationItem.titleView = titleLabel
    }
    //MARK:设置规定大小的左导航栏按钮
    func addCustomLeftBarButtonTitle(title: String) {
        let button = addButtonTitleAndFont(title: title, font: UIFont.systemFont(ofSize: 16))
        let leftItem = UIBarButtonItem.init(customView: button)
        leftItem.action = #selector(leftBarButtonItemAction(item:))
        self.navigationItem.leftBarButtonItem = leftItem
    }
    //MARK:设置规定大小的右导航栏按钮
    func addCustomRightBarButtonTitle(title: String) {
        let button = addButtonTitleAndFont(title: title, font: UIFont.systemFont(ofSize: 16))
        let rightItem = UIBarButtonItem.init(customView: button)
        rightItem.action = #selector(rightBarButtonItemAction(item:))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    //MARK:设置规定图片大小的左导航栏按钮
    func addCustomLeftBarButtonImage(image: UIImage) {
        let button = addButtonImageAndFont(image: image, size: CGSize(width: 70, height: 44))
        let leftItem = UIBarButtonItem.init(customView: button)
        leftItem.action = #selector(leftBarButtonItemAction(item:))
        self.navigationItem.leftBarButtonItem = leftItem
    }
    //MARK:设置规定图片大小的右导航栏按钮
    func addCustomRightBarButtonImage(image: UIImage) {
        let button = addButtonImageAndFont(image: image, size: CGSize(width: 70, height: 44))
        let rightItem = UIBarButtonItem.init(customView: button)
        rightItem.action = #selector(rightBarButtonItemAction(item:))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    /*
     自定义标签
     title: 标签名称
     font : 标签大小
     */
    func addLabelTitleAndFont(title: String, font: UIFont) -> UILabel {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 64))
        titleLabel.text = title
        titleLabel.font = font
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.textColor = mainColor
        return titleLabel
    }
    
    /*
     自定义按钮
     title: 名称
     font:  字体大小
     */
    func addButtonTitleAndFont(title: String, font: UIFont) -> UIButton {
        let titleButton = UIButton(type: .custom)
        titleButton.frame = CGRect(x: 0, y: 0, width: 70, height: 44)
        titleButton.setTitle(title, for: .normal)
        titleButton.titleLabel?.font = font
        titleButton.backgroundColor = mainColor
        return titleButton
    }
    
    /*
     自定义按钮
     image: 按钮图片
     size : 图片规定尺寸大小
     */
    func addButtonImageAndFont(image: UIImage, size: CGSize) -> UIButton {
        let titleButton = UIButton(type: .custom)
        titleButton.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        titleButton.setImage(image, for: .normal)
        titleButton.backgroundColor = mainColor
        return titleButton
    }
    
    //MARK:导航栏和状态栏的高度和
    func navigationHeight() -> CGFloat {
        return (self.navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    deinit {
        print("类销毁通知: \(self.classForCoder)")
    }
    
}
