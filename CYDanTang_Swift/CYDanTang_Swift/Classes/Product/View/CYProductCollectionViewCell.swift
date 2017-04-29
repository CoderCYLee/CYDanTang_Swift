//
//  CYProductCollectionViewCell.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/13.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit
import Kingfisher

protocol CYCollectionViewCellDelegate: NSObjectProtocol {
    func collectionViewCellDidClickedLikeButton(button: UIButton)
}

class CYProductCollectionViewCell: UICollectionViewCell {

    weak var delegate: CYCollectionViewCellDelegate?
    
    // 占位图片
    @IBOutlet weak var placeholderBtn: UIButton!
    // 背景图片
    @IBOutlet weak var productImageView: UIImageView!
    // 标题
    @IBOutlet weak var titleLabel: UILabel!
    // 价格
    @IBOutlet weak var priceLabel: UILabel!
    // 喜欢按钮
    @IBOutlet weak var likeButton: UIButton!
    
    var product: CYProduct? {
        didSet {
            let urlStr = product!.cover_image_url!
            let url = URL(string: urlStr)
            _ = productImageView.kf.setImage(with:url, placeholder: nil, options: [], progressBlock: nil, completionHandler: { (image, error, cacheType, imageURL) in
                self.placeholderBtn.isHidden = true
            })
            likeButton.setTitle(" " + String(product!.favorites_count!) + " ", for: .normal)
            titleLabel.text = product!.name
            priceLabel.text = "￥" + String(product!.price!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
}
