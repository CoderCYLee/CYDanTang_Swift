//
//  CYMeFooterView.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/22.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit
import Kingfisher

class CYMeFooterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        
        self.addSubview(meBlankButton)
        self.addSubview(messageLabel)
        meBlankButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.center.equalTo(self.center)
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(meBlankButton.snp.bottom).offset(kMargin)
            make.left.right.equalTo(self)
        }
    }
    
    private lazy var meBlankButton: UIButton = {
        let meBlankButton = UIButton()
        meBlankButton.setTitleColor(CYColor(r: 200, g: 200, b: 200, a: 1.0), for: .normal)
        meBlankButton.width = 100
        meBlankButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        meBlankButton.setImage(UIImage(named: "Me_blank_50x50_"), for: .normal)
        meBlankButton.addTarget(self, action: #selector(footerViewButtonClick), for: .touchUpInside)
        meBlankButton.imageView?.sizeToFit()
        return meBlankButton
    }()
    
    
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.text = "登录以享受功能"
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 15)
        messageLabel.textColor = CYColor(r: 200, g: 200, b: 200, a: 1.0)
        return messageLabel
    }()
    
    func footerViewButtonClick() {
        
    }
}
