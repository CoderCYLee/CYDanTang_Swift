//
//  CYProductDetailTopView.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/15.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

let detailCollectionViewCellID = "detailCollectionViewCellID"

class CYProductDetailTopView: UIView {

    var imageURLs = [String]()
    
    var product: CYProduct? {
        didSet {
            imageURLs = product!.image_urls!
            collectionView.reloadData()
            pageControl.numberOfPages = imageURLs.count
            titleLabel.text = product!.name
            priceLabel.text = "￥\(product!.price!)"
            describeLabel.text = product!.describe
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        addSubview(pageControl)
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(describeLabel)
        
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(collectionView.snp.bottom).offset(-30)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView.snp.bottom).offset(5)
            make.left.equalTo(self).offset(5)
            make.right.equalTo(self.snp.right).offset(-5)
            make.height.equalTo(30)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(titleLabel.snp.right)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.height.equalTo(25)
        }
        
        describeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(priceLabel.snp.left)
            make.right.equalTo(priceLabel.snp.right)
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
        }

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - lazy
    private lazy var collectionView: UICollectionView = {
        
        var flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: kScreenW, height: 375)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect(x:0, y:0, width:kScreenW, height:375.0), collectionViewLayout: flowLayout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        let nib = UINib(nibName: String(describing: CYProductDetailCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: detailCollectionViewCellID)
        
        return collectionView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        return pageControl
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.black
        return titleLabel
    }()
    
    /// 价格
    private lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.numberOfLines = 0
        priceLabel.textColor = CYGlobalRedColor()
        priceLabel.font = UIFont.systemFont(ofSize: 16)
        return priceLabel
    }()
    
    /// 描述
    private lazy var describeLabel: UILabel = {
        let describeLabel = UILabel()
        describeLabel.numberOfLines = 0
        describeLabel.textColor = CYColor(r: 0, g: 0, b: 0, a: 0.6)
        describeLabel.font = UIFont.systemFont(ofSize: 15)
        return describeLabel
    }()
}

extension CYProductDetailTopView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCollectionViewCellID, for: indexPath) as! CYProductDetailCollectionViewCell
        let url = imageURLs[indexPath.item]
        
        cell.bgImageView.kf.setImage(with: URL(string: url), placeholder: nil, options: [], progressBlock: nil) { (image, error, cacheType, imageURL) in
            cell.placeholderButton.isHidden = true
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let page = offsetX / scrollView.width
        pageControl.currentPage = Int(page + 0.5)
    }
}

