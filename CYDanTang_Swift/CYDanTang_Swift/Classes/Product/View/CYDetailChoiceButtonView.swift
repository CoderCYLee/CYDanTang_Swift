//
//  CYDetailChoiceButtonView.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/16.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit

protocol CYDetailChoiceButtonViewDegegate: NSObjectProtocol {
    /// 图文介绍按钮点击
    func choiceIntroduceButtonClick()
    /// 评论按钮点击
    func choicecommentButtonClick()
}

class CYDetailChoiceButtonView: UIView {
    
    weak var delegate: CYDetailChoiceButtonViewDegegate?

    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var commentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
 
    
    @IBAction func introduceButtonClick(sender: UIButton) {
        UIView.animate(withDuration: kAnimationDuration) {
            self.lineView.x = 0
        }
        delegate?.choiceIntroduceButtonClick()
    }
    
    @IBAction func commentButtonClick(sender: UIButton) {
        UIView.animate(withDuration: kAnimationDuration) {
            self.lineView.x = kScreenW * 0.5
        }
        delegate?.choicecommentButtonClick()
    }
    
    class func choiceButtonView() -> CYDetailChoiceButtonView {
        return fromNib(nibNameOrNil: String(describing: self))
    }
    
}
