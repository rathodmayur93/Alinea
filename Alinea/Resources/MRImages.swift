//
//  MRImages.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import Foundation

enum MRImages : String {
    
    //MARK:- BottomView Image
    case home = "house"
    case search = "magnifyingglass"
    case growth = "arrow.swap"
    case people = "person.2"
    case ideas = "lightbulb"
    
    //MARK:- Top View Images
    case hamburgerMenu = "hamburger"
    case notification = "bell"
    
    internal func getImageName() -> String{
        return self.rawValue
    }
}
