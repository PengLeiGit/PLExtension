//
//  NSNotificationCenter+Extension.swift
//  PLExtension
//
//  Created by 彭磊 on 2019/9/11.
//

import Foundation
import UIKit

/// 可继续扩展
extension Notification.Name {
    
    /// 通知名的前缀, 请拼接上去，防止重复
    public static let notName = "JK.Notification.Name."
    /// 接收到远程推送
    public static let remotePush = Notification.Name(notName + "remotePush")
    /// 重新登录
    public static let reLogin  = NSNotification.Name(notName +  "reLogin")
    /// 登录成功
    public static let login  = NSNotification.Name(notName + "login")
    /// 登录退出
    public static let logout  = NSNotification.Name(notName + "logout")
}






extension NotificationCenter {
    public static let shared = NotificationCenter.default
    /// 发送通知
    public static func pl_post(_ name: Notification.Name, object: Any? = nil) {
        shared.post(name: name, object: object, userInfo: nil)
    }
    
    /// 监听通知
    public static func pl_addObserver(_ observer: Any, selector: Selector, _ name: Notification.Name?, object: Any? = nil) {
        shared.addObserver(observer, selector: selector, name: name, object: object)
    }
    
    /// 移除通知
    public static func pl_remove(_ observer: Any, _ name: Notification.Name?, object: Any? = nil) {
        shared.removeObserver(observer, name: name, object: object)
    }
    
    /// 移除所有通知
    public static func pl_removeAll(_ observer: Any) {
        shared.removeObserver(observer)
    }
}

