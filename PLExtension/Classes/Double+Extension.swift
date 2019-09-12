//
//  Double+Extension.swift
//  PLExtension
//
//  Created by 彭磊 on 2019/9/12.
//

import Foundation
extension Double {
    
    /**
     * double类型转为（0.01）格式字符串。
     * 保留两位小数
     */
    public var unitValue: String {
        return String.init(format: "%.2f", self)
    }
}


//MARK: 类型转换
extension Double {
    
    /**
     * Double -> 字符串
     */
    public var stringValue: String {
        get {
            return String(self)
        }
    }
    
    
    /**
     * Double -> Float
     */
    public var folatValue: Float {
        get {
            return Float(self)
        }
    }
    
    /**
     * Double -> NSNumber
     */
    public var numberValue: NSNumber {
        get {
            return NSNumber.init(value: self)
        }
    }
    
}
