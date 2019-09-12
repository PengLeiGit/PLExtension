//
//  UIFont+Extension.swift
//  PLExtension
//
//  Created by 彭磊 on 2019/9/12.
//

import Foundation
extension UIFont {
    //字体
    public static func pl_font(_ font : CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: font)
    }
    
    public static func pl_boldFont(_ font : CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: font)
    }
}
