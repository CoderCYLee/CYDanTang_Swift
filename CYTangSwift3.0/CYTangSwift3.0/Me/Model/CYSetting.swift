//
//  CYSetting.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/22.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit

class CYSetting: NSObject {

    var iconImage: String?
    var leftTitle: String?
    var rightTitle: String?
    var isHiddenSwitch: Bool?
    var isHiddenRightTip: Bool?
    
    init(dict: [String: AnyObject]) {
        super.init()
        iconImage = dict["iconImage"] as? String
        leftTitle = dict["leftTitle"] as? String
        rightTitle = dict["rightTitle"] as? String
        isHiddenSwitch = dict["isHiddenSwitch"] as? Bool
        isHiddenRightTip = dict["isHiddenRightTip"] as? Bool
    }
    
}
