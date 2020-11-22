//
//  UIDevice+Extension.swift
//  Alinea
//
//  Created by ds-mayur on 21/11/2020.
//

import UIKit

extension UIDevice {
    var hasNotch: Bool {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
    
    var isNodgeDisplay : Bool {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
                case 1136:
                    debugPrint("iPhone 5 or 5S or 5C")
                    return false
                case 1334:
                    debugPrint("iPhone 6/6S/7/8")
                    return false
                case 1920, 2208:
                    debugPrint("iPhone 6+/6S+/7+/8+")
                    return false
                case 2436:
                    debugPrint("iPhone X/XS/11 Pro")
                    return true
                case 2688:
                    debugPrint("iPhone XS Max/11 Pro Max")
                    return true
                case 1792:
                    debugPrint("iPhone XR/ 11 ")
                    return true
                default:
                    debugPrint("Unknown")
                    return false
                }
            }
        return false
    }
}
