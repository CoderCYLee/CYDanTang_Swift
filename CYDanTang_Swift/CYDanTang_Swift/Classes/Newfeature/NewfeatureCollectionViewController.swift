//
//  NewfeatureCollectionViewController.swift
//  CYDanTang_Swift3.0
//
//  Created by Cyrill on 2016/12/9.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit
import SnapKit

private let reuseIdentifier = "newFeatureID"

class NewfeatureCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    /// collectionView
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 背景色
        self.view.backgroundColor = UIColor.white
        
        // flowlayout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = UIScreen.main.bounds.size
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        self.collectionView.backgroundColor = UIColor.white
        
        self.collectionView?.dataSource = self;
        self.collectionView?.delegate = self;
        
        self.view.addSubview(self.collectionView)
        
        // 设置 contentView 属性
        self.collectionView?.showsVerticalScrollIndicator = false
        self.collectionView?.bounces = false
        self.collectionView?.isPagingEnabled = true
        
        self.collectionView!.register(NewfeatureCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! NewfeatureCell
        cell.imageIndex = indexPath.item
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let path = collectionView.indexPathsForVisibleItems.last!
        if path.item == (4-1) {
            let cell = collectionView.cellForItem(at: path) as! NewfeatureCell
            cell.startBtnAnimation()
        }
    }
}

private class NewfeatureCell: UICollectionViewCell {
    var imageIndex: Int? {
        didSet {
            iconView.image = UIImage(named: "walkthrough_\(imageIndex! + 1)")
        }
    }
    
    func startBtnAnimation() {
        startButton.isHidden = false
        
        // 执行动画
        startButton.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        startButton.isUserInteractionEnabled = false
        
        // UIViewAnimationOptions(rawValue: 0) == OC knilOptions
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: [.init(rawValue: 0)], animations: { () -> Void in
            self.startButton.transform = CGAffineTransform.identity
        }, completion: { (_) -> Void in
            self.startButton.isUserInteractionEnabled = true
        })
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(iconView)
        contentView.addSubview(startButton)
        
        iconView.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }

        startButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(contentView.snp.bottom).offset(-50)
            make.size.equalTo(CGSize.init(width: 150, height: 40))
            make.centerX.equalToSuperview()
        }
    }
    
    private lazy var iconView = UIImageView()
    private lazy var startButton: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "btn_begin"), for: .normal)
        btn.addTarget(self, action: #selector(startButtonClick), for: .touchUpInside)
        btn.layer.masksToBounds = true
        btn.isHidden = true
        return btn
    }()
    
    func startButtonClick() {
        
        UIApplication.shared.keyWindow?.rootViewController = CYTabBarViewController()
    }
}
