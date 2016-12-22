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
        
        self.view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = self.headerView
        tableView.tableFooterView = self.footerView
        return tableView
    }()
    
    func messageButtonClick() {
        
    }
    
    func settingButtonClick() {
        
    }
    
    // MARK: - 头部按钮点击
    func iconButtonClick() {
        
    }
    

    fileprivate lazy var headerView: CYMeHeaderView = {
        let headerView = CYMeHeaderView()
        headerView.frame = CGRect(x:0, y:0, width:kScreenW, height:kCYMineHeaderImageHeight)
        headerView.iconButton.addTarget(self, action: #selector(iconButtonClick), for: .touchUpInside)
        headerView.messageButton.addTarget(self, action: #selector(messageButtonClick), for: .touchUpInside)
        headerView.settingButton.addTarget(self, action: #selector(settingButtonClick), for: .touchUpInside)
        return headerView
    }()
    
    fileprivate lazy var footerView: CYMeFooterView = {
        let footerView = CYMeFooterView()
        footerView.width = kScreenW
        footerView.height = 200
        return footerView
    }()
}

extension CYMeViewController: UITableViewDataSource, UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            var tempFrame = headerView.bgImageView.frame
            tempFrame.origin.y = offsetY
            tempFrame.size.height = kCYMineHeaderImageHeight - offsetY
            headerView.bgImageView.frame = tempFrame
        }
        
    }
}

