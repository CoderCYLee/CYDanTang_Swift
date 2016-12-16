//
//  CYCommentTableViewCell.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/16.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit
import Kingfisher

class CYCommentTableViewCell: UITableViewCell {

    var comment: CYComment? {
        didSet {
            let user = comment!.user
            let url = user!.avatar_url
            avatarImageView.kf.setImage(with: URL(string: url!))
            nicknameLabel.text = user!.nickname
            contentLabel.text = comment!.content
        }
    }
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nicknameLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
