//
//  CYProductDetailViewController.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/14.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit
import SnapKit

class CYProductDetailViewController: CYBaseViewController, CYProductDetailToolbarDelegate {

    var product: CYProduct?
    var type = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// 设置UI
    func setupUI() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "GiftShare_icon_18x22_"), style: .plain, target: self, action: #selector(shareBBItemClick))
        
        view.addSubview(scrollView)
        view.addSubview(toolbarView)
        
        scrollView.product = product
        
        scrollView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(toolbarView.snp.top)
        }
        
        toolbarView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.height.equalTo(45)
        }
        
        scrollView.contentSize = CGSize(width: kScreenW, height: kScreenH - 64 - 45 + 10 + 520)
    }
    
    func shareBBItemClick() {
        
    }
    
    // MARK: - lazy
    private lazy var scrollView: CYProductDetailScrollView = {
        let scrollView = CYProductDetailScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    private lazy var toolbarView: CYProductDetailToolbar = {
        
        let toolbarView: CYProductDetailToolbar = fromNib(nibNameOrNil: String(describing: CYProductDetailToolbar.self))
        toolbarView.delegate = self
        return toolbarView
    }()
    
    func toolBarDidClickedTMALLButton() {
        
    }
    
    
}

// 主要用于获取 UIView 的 Nib 对象，用于 View加在xib
func fromNib<T : UIView>(nibNameOrNil: String? = nil) -> T {
    let v: T? = fromNib(nibNameOrNil: nibNameOrNil)
    return v!
}

func fromNib<T : UIView>(nibNameOrNil: String? = nil) -> T? {
    var view: T?
    let name: String
    if let nibName = nibNameOrNil {
        name = nibName
    } else {
        // Most nibs are demangled by practice, if not, just declare string explicitly
        name = "\(T.self)".components(separatedBy: ".").last!
    }
    let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
    for v in nibViews! {
        if let tog = v as? T {
            view = tog
        }
    }
    return view
}


// MARK: - extension
extension CYProductDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var offsetY = scrollView.contentOffset.y
        if offsetY >= 465 {
            offsetY = CGFloat(465)
            scrollView.contentOffset = CGPoint(x: 0, y: offsetY)
        }
    }
}



/*
class func NibObject() -> UINib {
    let hasNib: Bool = Bundle.main.path(forResource: self.nameOfClass, ofType: "nib") != nil
    guard hasNib else {
        assert(!hasNib, "Invalid parameter") // assert
        return UINib()
    }
    return UINib(nibName: self.nameOfClass, bundle:nil)
}

//主要用于获取 UIView 的 Nib 对象，用于 View 加在 xib
class func fromNib<T : UIView>(nibNameOrNil: String? = nil) -> T {
    let v: T? = fromNib(nibNameOrNil: nibNameOrNil)
    return v!
}

class func fromNib<T : UIView>(nibNameOrNil: String? = nil) -> T? {
    var view: T?
    let name: String
    if let nibName = nibNameOrNil {
        name = nibName
    } else {
        // Most nibs are demangled by practice, if not, just declare string explicitly
        name = "\(T.self)".components(separatedBy: ".").last!
    }
    let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
    for v in nibViews! {
        if let tog = v as? T {
            view = tog
        }
    }
    return view
}

extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last! as String
}
 
 */
