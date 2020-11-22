//
//  MRColors.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import Foundation

enum MRColors : String {
    case whiteColor = "white"
    case lightGray = "lightGray"
    case backgroundColor = "backgroundColor"
    case bottomBarSelectedColor = "bottomBarSelectedColor"
    case textColor = "textColor"
    case separatorColor = "separatorColor"
    case themeBgColor = "themeBgColor"
    case themeBgBorderColor = "themeBgBorderColor"
    case subHeading = "subHeading"
    case profitableColor = "profitableColor"
    case nonProfitableColor = "nonProfitableColor"
    
    public func colorName() -> String {
        self.rawValue
    }
}
