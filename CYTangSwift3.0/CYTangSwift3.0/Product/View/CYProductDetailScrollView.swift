//
//  CYProductDetailScrollView.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/15.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit

class CYProductDetailScrollView: UIScrollView {

    var product: CYProduct? {
        didSet {
            topScrollView.product = product
            bottomScrollView.product = product
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(topScrollView)
        addSubview(bottomScrollView)
        
        topScrollView.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self)
            make.size.equalTo(CGSize(width: kScreenW, height: 520))
        }
        
        bottomScrollView.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(topScrollView.snp.bottom).offset(10)
            make.size.equalTo(CGSize(width: kScreenW, height: kScreenH - 64 - 45))
        }
    }
    
    /// 顶部滚动视图
    private lazy var topScrollView: CYProductDetailTopView = {
        let topScrollView = CYProductDetailTopView()
        topScrollView.backgroundColor = UIColor.white
        return topScrollView
    }()
    
    /// 底部滚动视图
    private lazy var bottomScrollView: CYProductDetailBottomView = {
        let bottomScrollView = CYProductDetailBottomView()
        bottomScrollView.backgroundColor = UIColor.white
        return bottomScrollView
    }()
    
}
