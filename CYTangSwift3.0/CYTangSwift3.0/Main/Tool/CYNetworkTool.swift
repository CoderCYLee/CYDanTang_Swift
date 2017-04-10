//
//  CYNetworkTool.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/13.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CYNetworkTool: NSObject {
    
    
    /// 单例
    static let shareNetworkTool = CYNetworkTool()
    
    /// 单品数据
    func loadProductData(page offset: NSInteger , finished: @escaping (_ products: [CYProduct]) -> ()) {
        let url = BASE_URL + "v2/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": offset]
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == 200 else {
                    print(message)
                    return
                }
                if let data = dict["data"].dictionary {
                    if let items = data["items"]?.arrayObject {
                        var products = [CYProduct]()
                        
                        let objArr: [AnyObject] = items as [AnyObject]
                        for item in objArr {
                            if let itemData = item["data"] {
                                let product = CYProduct(dict: itemData as! [String: AnyObject])
                                products.append(product)
                            }
                        }
                        finished(products)
                    }
                }
            }
        }
    }
    
    /// 获取单品详情数据
    func loadProductDetailData(id: Int, finished:@escaping (_ pruductDetail: CYProductDetail) -> ()) {
        let url = BASE_URL + "v2/items/\(id)"
        Alamofire.request(url, method: .get).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
//                let message = dict["message"].stringValue
                guard code == 200 else {
                    return
                }
                if let data = dict["data"].dictionaryObject {
                    let productDetail = CYProductDetail(dict: data as [String : AnyObject])
                    finished(productDetail)
                }
            }
        }
    }
    
    /// 商品详情 评论
    func loadProductDetailComments(id: Int, finished:@escaping (_ comments: [CYComment]) -> ()) {
        let url = BASE_URL + "v2/items/\(id)/comments"
        let params = ["limit": 20,
                      "offset": 0]
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
//                let message = dict["message"].stringValue
                guard code == 200 else {
                    return
                }
                
                if let data = dict["data"].dictionary {
                    if let commentsData = data["comments"]?.arrayObject {
                        var comments = [CYComment]()
                        for item in commentsData {
                            let comment = CYComment(dict: item as! [String: AnyObject])
                            comments.append(comment)
                        }
                        finished(comments)
                    }
                }
            }
        }
    }
}
