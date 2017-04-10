//
//  CYSettingViewController.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/22.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit

class CYSettingViewController: CYBaseViewController {
    
    var settings = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configCellFromPlist()
        setupTableView()
    }
    
    private func configCellFromPlist() {
        let path = Bundle.main.path(forResource: "SettingCell", ofType: ".plist")
        let settingsPlist = NSArray.init(contentsOfFile: path!)
        for arrayDict in settingsPlist! {
            let array = arrayDict as! NSArray
            var sections = [AnyObject]()
            for dict in array {
                let setting = CYSetting(dict: dict as! [String: AnyObject])
                sections.append(setting)
            }
            settings.append(sections as AnyObject);
        }
    }

    private func setupTableView() {

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
