//
//  CYMeViewController.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/16.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit

class CYMeViewController: CYBaseViewController {

    var cellCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    private lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.frame = self.view.bounds
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.tableHeaderView = headerView
//        tableView.tableFooterView = footerView
//        return tableView
//    }()

//    private lazy var headerView: UIView = {
//        
//    }()
//    
//    private lazy var footerView: UIView = {
//        
//    }()
}
