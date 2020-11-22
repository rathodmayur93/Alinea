//
//  CategoryModel.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import Foundation

struct CategoryModel {
    var name : DynamicBinding<String>!
    var imageName : DynamicBinding<String>!
    var backgroundColor : DynamicBinding<String>!
}

extension CategoryModel{
    
    internal func getAllCategoryModel() -> [CategoryModel]{
        return [
            CategoryModel(name: DynamicBinding("Stocks"),
                          imageName: DynamicBinding("dollarsign.circle"),
                          backgroundColor: DynamicBinding("#a5a4fd")),
            CategoryModel(name: DynamicBinding("ETFs"),
                          imageName: DynamicBinding("e.circle"),
                          backgroundColor: DynamicBinding("#4e4ece")),
            CategoryModel(name: DynamicBinding("Crypto"),
                          imageName: DynamicBinding("bitcoinsign.circle"),
                          backgroundColor: DynamicBinding("#fed83e"))
        ]
    }
}
