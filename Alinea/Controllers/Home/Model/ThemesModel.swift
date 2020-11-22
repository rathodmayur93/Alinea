//
//  ThemesModel.swift
//  Alinea
//
//  Created by ds-mayur on 18/11/2020.
//

import Foundation

struct ThemesModel {
    var name : DynamicBinding<String>!
    var imageName : DynamicBinding<String>!
}

extension ThemesModel {
    
    internal func getAllThemeModel() -> [ThemesModel]{
        return [
            ThemesModel(name: DynamicBinding("Diversity & Inclusion"), imageName: DynamicBinding("reading")),
            ThemesModel(name: DynamicBinding("Bold Biotech"), imageName: DynamicBinding("medical")),
            ThemesModel(name: DynamicBinding("Crypto Central"), imageName: DynamicBinding("bitcoin")),
            ThemesModel(name: DynamicBinding("She runs it"), imageName: DynamicBinding("superWoman")),
            ThemesModel(name: DynamicBinding("Clean & Green"), imageName: DynamicBinding("plants")),
            ThemesModel(name: DynamicBinding("Cannabis - ness"), imageName: DynamicBinding("marijuana")),
            ThemesModel(name: DynamicBinding("Power It"), imageName: DynamicBinding("battery")),
            ThemesModel(name: DynamicBinding("Foodie Fun"), imageName: DynamicBinding("cooking")),
            ThemesModel(name: DynamicBinding("Art & Fashion"), imageName: DynamicBinding("shopping")),
            ThemesModel(name: DynamicBinding("Home is where the heart is"), imageName: DynamicBinding("sweetHome"))
        ]
    }
}
