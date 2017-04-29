//
//  UITableView+EmptyData.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/14.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit

public extension UITableView {
    func tableView(message: String, image: String, cellCount: Int) {
        if cellCount == 0 {
            // 没有数据，显示图片
            let button = CYVerticalButton()
            button.setTitleColor(CYColor(r: 200, g: 200, b: 200, a: 1.0), for: .normal)
            button.setTitle(message, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            button.setImage(UIImage(named: image), for: .normal)
            button.addTarget(self, action: #selector(emptyButtonClick), for: .touchUpInside)
            button.imageView?.sizeToFit()
            backgroundView = button
            separatorStyle = .none
            
        } else {
            backgroundView = nil
            separatorStyle = .singleLine
        }
    }
    
    func emptyButtonClick() {
        print("---")
    }
}
