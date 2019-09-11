//
//  DispatchQueue+Extension.swift
//  PLExtension
//
//  Created by 彭磊 on 2019/9/11.
//

import Foundation

extension DispatchTime: ExpressibleByIntegerLiteral {
    /// 延迟
    public init(integerLiteral value: Int) {
        self = DispatchTime.now() + .seconds(value)
    }
}

extension DispatchTime: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = DispatchTime.now() + .milliseconds(Int(value * 1000))
    }
}
