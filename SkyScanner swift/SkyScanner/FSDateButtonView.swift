//
//  FSDateButtonView.swift
//  SkyScanner
//
//  Created by 翁志方 on 16/9/14.
//  Copyright © 2016年 翁志方. All rights reserved.
//

import UIKit

class FSDateButtonView: UIView {

    var titleLabel = UILabel.init()
    var deviderView = UIView.init()
    var timeLabel = UILabel.init()
    var timeImageView = UIImageView.init()
    
    var btn = UIButton.init()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // 圆角设置
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        
        //标题
        titleLabel.text = "日期"
        self.addSubview(titleLabel)

        // 分割线
        deviderView.backgroundColor = UIColor.lightGray
        self.addSubview(deviderView)
        
        // 时间label
        timeLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        self.addSubview(timeLabel)
        
        // 点击事件
        btn.frame = self.bounds
        btn.addTarget(self, action: #selector(btnClked), for: UIControlEvents.touchUpInside)
        self.addSubview(btn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnClked(){
        
    }
    
    

}
