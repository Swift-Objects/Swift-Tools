//
//  XYYNoMessageView.swift
//  xiaoyingying
//
//  Created by lemo on 2018/8/30.
//  Copyright © 2018年 youke. All rights reserved.
//

import UIKit
// 展示类型
enum MessageViewType {
    /// 该城市未开通
    case noOpen
    /// 无网络
    case noNetwork
    /// 无搜索结果
    case noSearchResults
    /// 无收藏
    case noCollection
    /// 无消息
    case noMessage
}

class XYYNoMessageView: MainXIBView {

    @IBOutlet weak var contextImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func removeSuperView() {
        self.removeSuperView()
    }

    func setViewType(type: MessageViewType?) {
        guard let viewType = type else {
            return
        }
        
        switch viewType {
        case .noOpen:
            self.contextImage.image = UIImage(named: "城市未开通")
            self.titleLabel.text = "此城市暂时未开通!"
        case .noNetwork:
            self.contextImage.image = UIImage(named: "网络无连接")
            self.titleLabel.text = "网络无法连接（无网络）!"
        case .noSearchResults:
            self.contextImage.image = UIImage(named: "未搜索到信息")
            self.titleLabel.text = "未搜索到信息!"
        case .noCollection:
            self.contextImage.image = UIImage(named: "暂时还没有添加收藏")
            self.titleLabel.text = "暂时还没有添加收藏!"
        case .noMessage:
            self.contextImage.image = UIImage(named: "未搜索到信息")
            self.titleLabel.text = "暂时没有消息!"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = UIFont.systemFont(ofSize: 17)
    }
    
}
