//
//  String+Extension.swift
//  PLExtension
//
//  Created by 彭磊 on 2019/9/10.
//

import Foundation
import UIKit
import CommonCrypto
//MARK: 类型转换
extension String {
    
    /**
     * 字符串 转 Int
     */
    public var intValue: Int {
        let str = self
        return Int(str) ?? 0
    }
    
    /**
     * 字符串 转 Float
     */
    public var floatValue: Float {
        let str = self
        return Float(str) ?? 0
    }
    
    /**
     * 字符串 转 Double
     */
    public var doubleValue: Double {
        let str = self
        return Double(str) ?? 0
    }
    
    /**
     * 字符串 转 Number
     */
    public var numberValue: NSNumber {
        let str = self
        let value = Int(str) ?? 0
        return NSNumber.init(value: value)
    }
}

extension String {
    
    /**
     * 判断是否电话号码 11位并且首位是1
     */
    public func jk_isPhoneNumber() -> Bool {
        if self.count != 11 { return false }
        if self.first != "1" { return false }
        return true
    }
    
    
    /**
     * 校验密码强度
     * 必须包含字母和数字，长度必须大于等于6
     */
    public func jk_isPassword() -> Bool {
        
        if self.count <= 5 {
            return false
        }
        
        let numberRegex:NSPredicate = NSPredicate(format:"SELF MATCHES %@","^.*[0-9]+.*$")
        let letterRegex:NSPredicate = NSPredicate(format:"SELF MATCHES %@","^.*[A-Za-z]+.*$")
        if numberRegex.evaluate(with: self) && letterRegex.evaluate(with: self) {
            return true
        } else {
            return false
        }
    }
    
}

extension String {
    
    /**
     * 计算字符串的高度
     */
    public func jk_getHeight(font: CGFloat, width: CGFloat) -> CGFloat {
        return jk_getHeight(font: UIFont.systemFont(ofSize: font), width: width)
    }
    
    public func jk_getHeight(font: UIFont, width: CGFloat) -> CGFloat {
        let statusLabelText: NSString = self as NSString
        let size = CGSize.init(width: width, height: 9000)
        let dic = NSDictionary(object: font, forKey: NSAttributedString.Key.font as NSCopying)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key : Any], context: nil).size
        return strSize.height
    }
    
    /**
     * 计算字符串的宽度
     */
    public func jk_getWidth(font: CGFloat, height: CGFloat) -> CGFloat {
        return jkGetWidth(font: UIFont.systemFont(ofSize: font), height: height)
    }
    public func jkGetWidth(font:UIFont,height:CGFloat) -> CGFloat {
        let statusLabelText: NSString = self as NSString
        let size = CGSize.init(width: 9999, height: height)
        let dic = NSDictionary(object: font, forKey: NSAttributedString.Key.font as NSCopying)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key : Any], context: nil).size
        return strSize.width
    }
    
    
    /**
     * 截取指定的区间
     */
    public func jk_clip(range: (location: Int, length: Int)) -> String {
        
        if range.location + range.length >= self.count {
            return self
        }
        let locationIndex = self.index(startIndex, offsetBy: range.location)
        let range = locationIndex..<self.index(locationIndex, offsetBy: range.length)
        return String(self[range])
    }
    
    
    /**
     * 字符串的截取 从头截取到指定index
     */
    public func jk_clipFromPrefix(to index: Int) -> String {
        
        if self.count <= index {
            return self
        } else {
            let index = self.index(self.startIndex, offsetBy: index)
            let str = self.prefix(upTo: index)
            return String(str)
        }
    }
    /**
     * 字符串的截取 从指定位置截取到尾部
     */
    public func jk_cutToSuffix(from index: Int) -> String {
        if self.count <= index {
            return self
        } else {
            let selfIndex = self.index(self.startIndex, offsetBy: index)
            let str = self.suffix(from: selfIndex)
            return String(str)
        }
    }
}


extension String {
    
    /**
     * 设置文本的颜色
     */
    public func jk_attributeColor(_ color: UIColor,range: NSRange) -> NSAttributedString {
        let attributedString = NSMutableAttributedString.init(string: self)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        return attributedString
    }
    /**
     * 设置文本的字体大小
     */
    public func jk_attributeFont(_ font: CGFloat, range: NSRange) -> NSAttributedString {
        let attributedString = NSMutableAttributedString.init(string: self)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: font), range: range)
        return attributedString
    }
    
    /**
     * 设置文本的字体大小和颜色
     */
    public func jk_attributeFontAndColor(font: CGFloat,
                                         fontRange: NSRange,
                                         color: UIColor,
                                         colorRange: NSRange)
        -> NSAttributedString {
            let attributedString = NSMutableAttributedString.init(string: self)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: colorRange)
            
            attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: font), range: fontRange)
            return attributedString
    }
    
    /**
     * 设置删除线 NSStrikethroughStyleAttributeName
     */
    public func jk_attributeStrikethrough() -> NSAttributedString {
        let range = NSMakeRange(0, self.count)
        let attributedString = NSMutableAttributedString.init(string: self)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: range)
        return attributedString
    }
    
    /**
     * 同时设置设置删除线和字体大小
     */
    public func jk_attributeStrikethroughAndFont(_ font: CGFloat,range: NSRange) -> NSAttributedString {
        let attributedString = NSMutableAttributedString.init(string: self)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: range)
        
        let deleTeRange = NSMakeRange(0, self.count)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: deleTeRange)
        
        return attributedString
    }
    
    
    /**
     * 设置文本的行间距
     */
    public func jk_attributeParagraph(lineSpace: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString.init(string: self)
        let paragraphStyle = NSMutableParagraphStyle.init()
        paragraphStyle.lineSpacing = lineSpace
        let range = NSRange.init(location: 0, length: self.count)
        attributedString.addAttributes([NSAttributedString.Key.paragraphStyle:paragraphStyle], range: range)
        
        return attributedString
    }
    
    
    
    
    /**
     * 设置图文详情
     */
    public func jk_attributeTextAttachment(image: UIImage?, imageFrame: CGRect) -> NSMutableAttributedString {
        
        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
        let nameStr : NSAttributedString = NSAttributedString(string: " " + self, attributes: nil)
        
        let attachment = NSTextAttachment.init()
        attachment.image = image
        attachment.bounds = imageFrame
        
        attributedStrM.append(NSAttributedString(attachment: attachment))
        attributedStrM.append(nameStr)
        return attributedStrM
    }
}


extension String {
    
    
    /// 对播放路径中的中文字符处理
    public func jk_processChineseCharactersInPlayPath() -> String {
        func isIncludeChineseIn(string: String) -> Bool {
            
            for (_, value) in string.enumerated() {
                
                if ("\u{4E00}" <= value  && value <= "\u{9FA5}") {
                    return true
                }
            }
            return false
        }
        
        var endPlayPath = ""
        
        if isIncludeChineseIn(string: self) {
            endPlayPath = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        } else {
            endPlayPath = self
        }
        
        return endPlayPath
    }
    
    
    /**
     * 字符串转字典
     */
    public func jk_transformToDictionary() -> NSDictionary {
        let jsonData:Data = self.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
    
    
    /**
     * MD5加密
     * 需要在桥接文件中引入 <CommonCrypto/CommonDigest.h>
     */
    public func jk_md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deinitialize(count: 0)
        
        return String(format: hash as String)
    }
}

extension String {
    
    /**
     * 生成二维码图片
     * logoImage 中间的图片logo
     */
    public func jk_makeQRImage(_ logoImage: UIImage? = nil) -> UIImage? {
        
        let qrString = self
        
        let stringData = qrString.data(using: String.Encoding.utf8, allowLossyConversion: false)
        //创建一个二维码的滤镜
        let qrFilter = CIFilter(name: "CIQRCodeGenerator")
        qrFilter?.setValue(stringData, forKey: "inputMessage")
        qrFilter?.setValue("H", forKey: "inputCorrectionLevel")
        let qrCIImage = qrFilter?.outputImage
        
        // 创建一个颜色滤镜,黑白色
        let colorFilter = CIFilter(name: "CIFalseColor")!
        colorFilter.setDefaults()
        colorFilter.setValue(qrCIImage, forKey: "inputImage")
        colorFilter.setValue(CIColor(red: 0, green: 0, blue: 0), forKey: "inputColor0")
        colorFilter.setValue(CIColor(red: 1, green: 1, blue: 1), forKey: "inputColor1")
        // 返回二维码image
        let codeImage = UIImage(ciImage: (colorFilter.outputImage!.transformed(by: CGAffineTransform(scaleX: 5, y: 5))))
        
        // 中间一般放logo
        if logoImage != nil {
            let whiteImage = UIColor.white.makeImage()
            let whiteWaterImage = codeImage.addWatermark(image: whiteImage, scale: 4.1)
            let waterImage = whiteWaterImage.addWatermark(image: logoImage!, scale: 5)
            return waterImage
        }
        return codeImage
        
    }
}

// 以下为上面对外方法提供服务
extension UIColor {
    
    /**
     * 通过颜色生成图片
     */
    fileprivate func makeImage() -> UIImage {
        let rect = CGRect.init(x: 0.0, y: 0.0, width: 6.0, height: 6.0)
        UIGraphicsBeginImageContext(rect.size)
        let context : CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(self.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension UIImage {
    /**
     * 给图片添加水印图片
     */
    fileprivate func addWatermark(image: UIImage,scale: CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(self.size)
        
        self.draw(in: CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        let waterWH = self.size.width / scale
        let waterX = (self.size.width - waterWH) / 2
        let waterH = (self.size.height - waterWH) / 2
        
        image.draw(in: CGRect.init(x: waterX, y: waterH, width: waterWH, height: waterWH))
        UIGraphicsEndPDFContext()
        let imageNew = UIGraphicsGetImageFromCurrentImageContext()
        return imageNew!
    }
}

//MARK: - 给String类添加下标扩展
public extension String {
    
    subscript(start:Int, length:Int) -> String {
        get {
            
            if start >= self.count {
                return ""
            }
            
            if (start + length) > self.count {
                let selfIndex = self.index(self.startIndex, offsetBy: start)
                let str = self.suffix(from: selfIndex)
                return String(str)
            }
            
            
            let index1 = self.index(self.startIndex, offsetBy: start)
            let index2 = self.index(index1, offsetBy: length)
            let range = Range(uncheckedBounds: (lower: index1, upper: index2))
            return String(self[range])
        }
        set {
            let tmp = self
            var s = ""
            var e = ""
            for (idx, item) in tmp.enumerated() {
                if(idx < start) {
                    s += "\(item)"
                }
                if(idx >= start + length) {
                    e += "\(item)"
                }
            }
            self = s + newValue + e
        }
    }
    
    subscript(index:Int) -> String {
        get {
            if index >= self.count {
                return ""
            }
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
        set {
            let tmp = self
            self = ""
            for (idx, item) in tmp.enumerated() {
                if idx == index {
                    self += "\(newValue)"
                } else {
                    self += "\(item)"
                }
            }
        }
    }
}
