//
//  UIView+Extension.swift
//  PLExtension
//
//  Created by 彭磊 on 2019/9/10.
//

import Foundation
extension UIView {
    /**
     * 将一个UIView视图转为图片
     * opaque 参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES， default为true
     */
    public func pl_makeImage(_ opaque: Bool = true) -> UIImage {
        let size = self.bounds.size
        
        /**
         * 第一个参数表示区域大小。
         第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。
         第三个参数就是屏幕密度了
         */
        UIGraphicsBeginImageContextWithOptions(size, opaque, UIScreen.main.scale)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}


extension UIView {
    /**
     * 通过贝塞尔曲线，裁切四个边的任意几个的圆角
     */
    public func pl_clipCorners(_ corner:UIRectCorner, cornerRadii:CGSize) {
        
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: cornerRadii)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}

// 增加点击手势
extension UIView {
    /// 类型集合
    private struct PLClosureContainer {
        var pl_tapClosure: ((UIView) -> ())
    }
    
    /// 转换的 key 集合
    private struct PLAssociatedKeys {
        static var pl_tapKey: PLClosureContainer?
    }
    
    /// 设置点击属性
    private var pl_tapContainer: PLClosureContainer? {
        get {
            if let newClosure = objc_getAssociatedObject(self, &PLAssociatedKeys.pl_tapKey) as? PLClosureContainer {
                return newClosure
            }
            return nil
        }
        
        set(newValue) {
            objc_setAssociatedObject(self, &PLAssociatedKeys.pl_tapKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    /// 点击事件回调闭包
    public func pl_addTapClosure(_ closure: @escaping ((UIView) -> ())) {
        let blockContainer = PLClosureContainer(pl_tapClosure: closure)
        self.pl_tapContainer = blockContainer
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(pl_tapClick))
        self.addGestureRecognizer(tap)
    }
    
    /// 点击事件
    @objc private func pl_tapClick() {
        self.pl_tapContainer?.pl_tapClosure(self)
    }
    
    /// 添加手势点击事件
    public func pl_addTarget(_ target: Any?, action: Selector?) {
        
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tap)
    }
}
