//
//  CYVerticalButton.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/16.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit

class CYVerticalButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 调整图片
        imageView?.x = 10
        imageView?.y = 0
        imageView?.width = self.width - 20
        imageView?.height = imageView!.width
        // 调整文字
        titleLabel?.x = 0
        titleLabel?.y = imageView!.height
        titleLabel?.width = self.width
        titleLabel?.height = self.height - self.titleLabel!.y
    }

}
