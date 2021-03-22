//
//  Utils.swift
//  AKSwiftSlideMenu
//
//  Created by Bet Data Analysis on 9/13/19.
//  Copyright © 2019 Kode. All rights reserved.
//

import UIKit
import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG
import StoreKit

class Utils  {
    
    public func obtenerSerial()-> String
    {
        var serial = String()
        serial = UIDevice.current.identifierForVendor?.uuidString ?? ""
        return serial
        
    }
    
    public  func colorUIHex (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    public    func codificarMD5(string: String) -> String {
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        
        let listo=digestData.map { String(format: "%02hhx", $0) }.joined()
        
        return listo
    }
    
    public func obtenerUrlServicios()-> String
    {
        return "http://www.betdatanalysis.com/betdatarest/consultas/"
    }
    
    
    
}
