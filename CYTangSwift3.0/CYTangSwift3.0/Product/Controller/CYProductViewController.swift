//
//  CYProductViewController.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/13.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit

fileprivate let collectionCellID = "CYCollectionViewCell"


class CYProductViewController: CYBaseViewController {

    var products = [CYProduct]()
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "单品"
        
        /// 设置collectionView
        setupCollectionView()
        
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.gray
        refreshControl.attributedTitle = NSAttributedString.init(string: "下拉刷新")
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        self.collectionView?.refreshControl = refreshControl
        
        self.collectionView?.refreshControl?.beginRefreshing()
        CYNetworkTool.shareNetworkTool.loadProductData(page: 0) { [weak self](products) in
            self!.collectionView?.refreshControl?.endRefreshing()
            self!.products = products
            self!.collectionView!.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func loadData() {
                
        CYNetworkTool.shareNetworkTool.loadProductData(page: 0) { [weak self](products) in
            self!.collectionView?.refreshControl?.endRefreshing()
            self!.products = products
            self!.collectionView!.reloadData()
        }
    }
    
    /// 设置collectionView
    private func setupCollectionView() {
        
        let width: CGFloat = (UIScreen.main.bounds.width - 20) / 2
        let height: CGFloat = 245
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: width, height: height)
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: UIScreen.main.bounds.size.height-49)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.backgroundColor = view.backgroundColor
        collectionView.dataSource = self
        let nib = UINib(nibName: String(describing: CYProductCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: collectionCellID)
        view.addSubview(collectionView)
        self.collectionView = collectionView
    }
}

extension CYProductViewController: UICollectionViewDelegate, UICollectionViewDataSource, CYCollectionViewCellDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! CYProductCollectionViewCell
        cell.product = products[indexPath.item]
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productDetailVC = CYProductDetailViewController()
        productDetailVC.title = "商品详情"
        productDetailVC.product = products[indexPath.item]
        navigationController?.pushViewController(productDetailVC, animated: true)
    }
    
    // MARK: - CYCollectionViewCellDelegate
    func collectionViewCellDidClickedLikeButton(button: UIButton) {
        
    }
}
