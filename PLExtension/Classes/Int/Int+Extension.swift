//
//  Int+Extension.swift
//  PLExtension
//
//  Created by 彭磊 on 2019/9/10.
//

import Foundation
//MARK: 类型转换
extension Int {
    
    /**
     * Int -> 字符串
     */
    public var stringValue: String {
        get {
            return String(self)
        }
    }
    
    
    /**
     * Int -> Float
     */
    public var folatValue: Float {
        get {
            return Float(self)
        }
    }
    
    /**
     * Int -> Double
     */
    public var doubleValue: Double {
        get {
            return Double(self)
        }
    }
    
    
    /**
     * Int -> NSNumber
     */
    public var numberValue: NSNumber {
        get {
            return NSNumber.init(value: self)
        }
    }
    
}
