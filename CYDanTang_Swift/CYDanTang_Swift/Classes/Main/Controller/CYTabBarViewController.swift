//
//  CYTabBarViewController.swift
//  CYDanTang_Swift3.0
//
//  Created by Cyrill on 2016/12/12.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit

class CYTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(red: 245 / 255, green: 80 / 255, blue: 83 / 255, alpha: 1.0)
        
        // 添加子控制器
        addChildViewControllers()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func addChildViewControllers() {
//        cy_addChildViewController(childControllerName: String(describing: CYHomePageViewController.self), title: "首页", imageName: "TabBar_home_23x23_")
//        cy_addChildViewController(childControllerName: String(describing: CYProductViewController.self), title: "单品", imageName: "TabBar_gift_23x23_")
//        cy_addChildViewController(childControllerName: String(describing: CYCategoryViewController.self), title: "分类", imageName: "TabBar_category_23x23_")

        setItem(vc: CYHomePageViewController(), title: "首页", imageName: "TabBar_home_23x23_")
        setItem(vc: CYProductViewController(), title: "单品", imageName: "TabBar_gift_23x23_")
        setItem(vc: CYCategoryViewController(), title: "分类", imageName: "TabBar_category_23x23_")
        setItem(vc: CYMeViewController(), title: "我", imageName: "TabBar_me_boy_23x23_")
    }
    
    private func setItem(vc: UIViewController, title: String, imageName: String) {
        // 设置对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        vc.title = title
        // 给每个控制器包装一个导航控制器
        let nav = CYNavigationViewController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
    }

    private func cy_addChildViewController(childControllerName: String, title: String, imageName: String) {
        
        
//        //method1
//        //方法 NSClassFromString 在Swift中已经不起作用了no effect，需要适当更改
//        if  let appName: String = Bundle.main.infoDictionary!["CFBundleName"] as! String? {
//            // generate the full name of your class (take a look into your "appname-swift.h" file)
//            //            let classStringName = "_TtC\(appName!.utf16Count)\(appName!)\(count(className))\(className)"//xcode 6.1-6.2 beta
//            let classStringName = "_TtC\(appName.lengthOfBytes(using: String.Encoding(rawValue: String.Encoding.utf16.rawValue))/2)\(appName)\(childControllerName.lengthOfBytes(using: String.Encoding(rawValue: String.Encoding.utf16.rawValue)))\(childControllerName)"
//            var  cls: AnyClass? = NSClassFromString(classStringName)
//            //  method2
//            //cls = NSClassFromString("\(appName!).\(className)")
//            assert(cls != nil, "class not found,please check className")
//            
//        }
//        
//    
//        //Swift中命名空间的概念
//        guard let nameSpage = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
//            print("没有命名空间")
//            return
//        }
//        
//        print("nameSpage:\(nameSpage)")
//        
//        let ss = nameSpage + "." + childControllerName;
//        
//        let classStringName = "_TtC\(count(nameSpage!))\(nameSpage!)\(count(nameSpage))\(childControllerName)"
//        guard let childVcClass = NSClassFromString(classStringName) else {
//            print("没有获取到对应的class")
//            // 这里不知道为什么获取不到
//            return
//        }
//        
//        
//        guard let childVcType = childVcClass as? UIViewController.Type else {
//            print("没有得到的类型")
//            return
//        }
        
//        print("nameSpage:\(nameSpage),childVcClass:\(childVcClass),childVcType:\(childVcType)")
        
        // 动态获取命名空间
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
//        ns = "CYTangSwift3-0"
        // 将字符串转化为类，默认情况下命名空间就是项目名称，但是命名空间可以修改
        let cls: AnyClass? = NSClassFromString(ns + "." + childControllerName)
        let vcClass = cls as! UIViewController.Type
        let vc = vcClass.init()
        // 设置对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        vc.title = title
        // 给每个控制器包装一个导航控制器
        let nav = CYNavigationViewController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
        
    }
    
}
