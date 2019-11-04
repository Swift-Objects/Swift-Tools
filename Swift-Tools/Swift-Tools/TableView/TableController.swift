//
//  TableController.swift
//  Swift-Tools
//
//  Created by lemo on 2018/6/4.
//  Copyright © 2018年 wangli. All rights reserved.
//

import UIKit

class TableController: BQSMainViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        addTableView()
    }
    
    var tableView: UITableView?
    let cellIdentifier = "UITableViewCell"
    
    func addTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: BQSScreenWidth, height: ScreenHeight))
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        //        tableView?.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: cellIdentifier)
        self.view.addSubview(tableView!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = .red
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击:\(indexPath)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
