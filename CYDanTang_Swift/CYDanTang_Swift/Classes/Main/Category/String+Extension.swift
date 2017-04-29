//
//  String+Extension.swift
//  CYTangSwift3.0
//
//  Created by Cyrill on 2016/12/14.
//  Copyright © 2016年 Cyrill. All rights reserved.
//

import Foundation

public extension String {
    
    /// 判断手机号是否合法
    static func isValidMobile(string: String) -> Bool {
        // 判断是否是手机号
        let patternString = "^1[3|4|5|7|8][0-9]\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", patternString)
        return predicate.evaluate(with: string)
    }
    
    /// 判断密码是否合法
    static func isValidPasswod(string: String) -> Bool {
        // 验证密码是 6 - 16 位字母或数字
        let patternString = "^[0-9A-Za-z]{6,16}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", patternString)
        return predicate.evaluate(with: string)
    }
}
