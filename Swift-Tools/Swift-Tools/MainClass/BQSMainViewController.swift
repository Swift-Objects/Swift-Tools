//
//  BQSMainViewController.swift
//  FaceStore-Swift
//
//  Created by lemo on 2018/4/19.
//  Copyright © 2018年 wangli. All rights reserved.
//

import UIKit

enum UITableViewCellType {
    case XIB // xib
    case CODE // code
}

class BQSMainViewController: UIViewController {
    internal let mainColor = UIColor.white
    /// navbar高度
    internal let navBarHeight: CGFloat = IS_IPHONE_X ? 88 : 64
    
    /// 导航栏高度
    internal func navigationBarHeight() -> CGFloat {
        return self.navigationController?.navigationBar.bounds.height ?? navBarHeight }
    
    /// tabBar高度
    internal func tabBarHeight() -> CGFloat {
        return (self.tabBarController?.tabBar.bounds.height)!}
    
    /// 状态栏高度
    internal func statusBarHeight() -> CGFloat {
        return UIApplication.shared.statusBarFrame.height }
    
    /// 有状态栏 有导航栏 有tabbar 的屏幕高度
    internal func haveStatusTabNavigationBarScreenHeight() -> CGFloat {
        return BQSScreenWidth - navigationBarHeight() - tabBarHeight() - statusBarHeight()
    }
    
    /// 有状态栏 有导航栏 无tabbar 的屏幕高度
    internal func haveStatusNavigationBarScreenHeight() -> CGFloat {
        return BQSScreenWidth - navigationBarHeight() - statusBarHeight()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //背景色-导航栏背景色-状态栏字体色
        self.view.backgroundColor = mainColor
        self.navigationController?.navigationBar.barTintColor = .black
//        UIApplication.shared.statusBarStyle = .lightContent
        setNeedsStatusBarAppearanceUpdate()
        setNavigationItemTitleWithColor(color: mainColor)
    }
    
    var darkMode = false
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return darkMode ? .default : .lightContent
    }
    
    
    // MARK:--------------系统的导航栏按钮添加文字或者图片-----------------
    //MARK:左导航栏按钮添加图片
    internal func addLeftBarButtonItemWithImage(image: UIImage) {
        let leftItem = UIBarButtonItem(image: image,
                                       style: .done,
                                       target: self,
                                       action: #selector(leftBarButtonItemAction(item:)))
        self.navigationItem.leftBarButtonItem = leftItem
        setLeftBarButtonItemWithColor(color: mainColor)
    }
    //MARK:左导航栏按钮添加标题
    internal func addLeftBarButtonItemWithTitle(title: String) {
        let leftItem = UIBarButtonItem(title: title,
                                       style: .done,
                                       target: self,
                                       action: #selector(leftBarButtonItemAction(item:)))
        self.navigationItem.leftBarButtonItem = leftItem
        setLeftBarButtonItemWithColor(color: mainColor)
    }
    //MARK:左导航栏按钮点击事件
    @objc internal func leftBarButtonItemAction(item: UIBarButtonItem) {
        print("左导航栏按钮点击事件")
    }
    
    //MARK:右导航栏按钮添加图片
    internal func addRightBarButtonItemWithImage(image: UIImage) {
        let rightItem = UIBarButtonItem(image: image,
                                        style: .done,
                                        target: self,
                                        action: #selector(rightBarButtonItemAction(item:)))
        self.navigationItem.rightBarButtonItem = rightItem
        setRightBarButtonItemWithColor(color: mainColor)
    }
    //MARK:右导航栏按钮添加标题
    internal func addRightBarButtonItemWithTitle(title: String) {
        let rightItem = UIBarButtonItem(title: title,
                                        style: .done,
                                        target: self,
                                        action: #selector(rightBarButtonItemAction(item:)))
        self.navigationItem.rightBarButtonItem = rightItem
        setRightBarButtonItemWithColor(color: mainColor)
    }
    //MARK:右导航栏按钮点击事件
    @objc internal func rightBarButtonItemAction(item: UIBarButtonItem) {
        print("右导航栏按钮点击事件")
    }
    
    //MARK:设置左导航栏颜色
    internal func setLeftBarButtonItemWithColor(color: UIColor) {
        self.navigationItem.leftBarButtonItem?.tintColor = color
    }
    //MARK:设置右导航栏颜色
    internal func setRightBarButtonItemWithColor(color: UIColor) {
        self.navigationItem.rightBarButtonItem?.tintColor = color
    }
    //MARK:设置导航栏title颜色
    internal func setNavigationItemTitleWithColor(color: UIColor) {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
    }
    
    //MARK: -------------------自定义导航栏大小-------------------------
    //MARK:设置规定大小的title
    internal func addNavigationTitle(font: UIFont,
                                     title: String) {
        let titleLabel = addLabelTitleAndFont(title: title,
                                              font: font)
        self.navigationItem.titleView = titleLabel
    }
    
    //MARK:设置规定大小的左导航栏按钮
    internal func addCustomLeftBarButtonTitle(title: String) {
        let button = addButtonTitleAndFont(title: title,
                                           font: UIFont.systemFont(ofSize: 16))
        let leftItem = UIBarButtonItem.init(customView: button)
        leftItem.action = #selector(leftBarButtonItemAction(item:))
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    //MARK:设置规定大小的右导航栏按钮
    internal func addCustomRightBarButtonTitle(title: String) {
        let button = addButtonTitleAndFont(title: title,
                                           font: UIFont.systemFont(ofSize: 16))
        let rightItem = UIBarButtonItem.init(customView: button)
        rightItem.action = #selector(rightBarButtonItemAction(item:))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    //MARK:设置规定图片大小的左导航栏按钮
    internal func addCustomLeftBarButtonImage(image: UIImage) {
        let button = addButtonImageAndFont(image: image,
                                           size: CGSize(width: 70, height: 44))
        let leftItem = UIBarButtonItem.init(customView: button)
        leftItem.action = #selector(leftBarButtonItemAction(item:))
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    //MARK:设置规定图片大小的右导航栏按钮
    internal func addCustomRightBarButtonImage(image: UIImage) {
        let button = addButtonImageAndFont(image: image,
                                           size: CGSize(width: 70, height: 44))
        let rightItem = UIBarButtonItem.init(customView: button)
        rightItem.action = #selector(rightBarButtonItemAction(item:))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    /*
     自定义标签
     title: 标签名称
     font : 标签大小
     */
    internal func addLabelTitleAndFont(title: String,
                                       font: UIFont) -> UILabel {
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
    internal func addButtonTitleAndFont(title: String,
                                        font: UIFont) -> UIButton {
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
    internal func addButtonImageAndFont(image: UIImage,
                                        size: CGSize) -> UIButton {
        let titleButton = UIButton(type: .custom)
        titleButton.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        titleButton.setImage(image, for: .normal)
        titleButton.backgroundColor = mainColor
        return titleButton
    }
    
    //MARK:控制器跳转
    internal func collectionViewController() {
        let collectionVC = CollectionViewController();
        navigationControllerPushVC(VC: collectionVC)
    }
    
    internal func horizontalCollectionViewController() {
        let horizontal = HorizontalCollectionViewController()
        navigationControllerPushVC(VC: horizontal)
    }
    
     internal func tableController() {
        let tableVC = TableController()
        navigationControllerPushVC(VC: tableVC)
    }
    // private: 当前类
    // fileprivate: 当前文件
    // internal（默认访问级别，模块内可以访问）
    // public 可以被任何人访问,但是在其他模块不能被重写和继承
    // open 可以被任何人访问,也可以被重写和继承
    private func navigationControllerPushVC(VC: BQSMainViewController) {
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    //MARK: 控件
    // tableView
    internal func getTableView(cells: [UITableViewCell],
                               cellIdentifiers:[NSString],
                               cellType: UITableViewCellType) -> UITableView {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: BQSScreenWidth, height: ScreenHeight))
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = mainColor
        for cell in cells {
            if cellType == .XIB {
                tableView.register(UINib.init(nibName: NSStringFromClass(cell.classForCoder), bundle: nil), forCellReuseIdentifier: NSStringFromClass(cell.classForCoder))
            } else {
                tableView.register(cell.classForCoder,
                                   forCellReuseIdentifier: NSStringFromClass(cell.classForCoder))
            }
        }
        return tableView
    }
    
    internal func getCollectionView(cells: [UICollectionViewCell],
                                    cellIdentifiers:[NSString],
                                    cellType: UITableViewCellType) -> UICollectionView {
        let left: CGFloat = 3
        let spacing: CGFloat = 3
        let number: Int = 3
        let width = (self.view.frame.width - left * 2 - CGFloat(number - 1) * spacing) / CGFloat(number)
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: left, bottom: 0, right: left)
        layout.itemSize = CGSize(width: width, height: width)
        let collectionView = UICollectionView(frame: self.view.bounds,
                                              collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        for cell in cells {
            if cellType == .XIB {
                collectionView.register(UINib.init(nibName: NSStringFromClass(cell.classForCoder), bundle: nil), forCellWithReuseIdentifier: NSStringFromClass(cell.classForCoder))
            } else {
                collectionView.register(cell.classForCoder,
                                        forCellWithReuseIdentifier: NSStringFromClass(cell.classForCoder))
            }
        }
        return collectionView
    }
    
    internal func showAlertController(title: String,
                                      message: String,
                                      sureString: String,
                                      cancelString: String,
                                      sureAction:@escaping(_ index: UIAlertAction) -> Void,
                                      cancelAction:@escaping(_ index: UIAlertAction) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.actionSheet)
        let sure = UIAlertAction(title: sureString,
                                 style: .default) { (action) in
            sureAction(action)
        }
        let cancel = UIAlertAction(title: cancelString,
                                   style: .cancel) { (action) in
            cancelAction(action)
        }
        alert.addAction(sure)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    deinit {
        print("\(self.classForCoder): 类销毁通知")
    }
    
}
