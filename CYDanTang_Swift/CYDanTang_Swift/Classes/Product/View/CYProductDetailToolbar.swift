//
//  CYProductDetailToolbar.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/15.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit

protocol CYProductDetailToolbarDelegate: NSObjectProtocol {
    func toolBarDidClickedTMALLButton()
}

class CYProductDetailToolbar: UIView {

    weak var delegate: CYProductDetailToolbarDelegate?
    
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        likeButton.layer.borderColor = CYGlobalRedColor().cgColor
        likeButton.layer.borderWidth = 1.0
        
        likeButton.setImage(UIImage(named: "content-details_like_16x16_"), for: .normal)
        likeButton.setImage(UIImage(named: "content-details_like_selected_16x16_"), for: .selected)
    }
    
    @IBAction func likeButtonClick(sender: UIButton) {
        
    }
    
    @IBAction func goTMALLButtonClick() {
        delegate?.toolBarDidClickedTMALLButton()
    }
    
}
