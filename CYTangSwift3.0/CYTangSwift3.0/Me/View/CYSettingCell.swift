//
//  CYSettingCell.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/22.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit

class CYSettingCell: UITableViewCell {

    var setting: CYSetting? {
        didSet {
            iconImageView.image = UIImage(named: setting!.iconImage!)
            leftLabel.text = setting!.leftTitle
            rightLabel.text = setting!.rightTitle
            disclosureIndicator.isHidden = setting!.isHiddenRightTip!
            switchView.isHidden = setting!.isHiddenSwitch!
        }
    }
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var disclosureIndicator: UIImageView!
    
    @IBOutlet weak var switchView: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
