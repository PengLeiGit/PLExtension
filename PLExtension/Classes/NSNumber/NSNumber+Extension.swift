//
//  NSNumber+Extension.swift
//  PLExtension
//
//  Created by 彭磊 on 2019/9/10.
//

import Foundation
extension NSNumber {
    
    /**
     * number类型转为（0.01）格式字符串。
     * 保留两位小数
     */
    public var unitValue: String {
        return String.init(format: "%.2f", self.floatValue)
    }
}
