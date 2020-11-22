//
//  PagerModel.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import Foundation

struct PagerModel {
    var name : DynamicBinding<String>!
    var isSelected : DynamicBinding<Bool>!
    var isSeparatorVisible : DynamicBinding<Bool>!
}

extension PagerModel {
    
    func getAllPagerModel() -> [PagerModel]{
        return [
            PagerModel(name: DynamicBinding("Category"),
                       isSelected: DynamicBinding(true),
                       isSeparatorVisible: DynamicBinding(true)),
            PagerModel(name: DynamicBinding("Themes"),
                       isSelected: DynamicBinding(false),
                       isSeparatorVisible: DynamicBinding(true)),
            PagerModel(name: DynamicBinding("Trending"),
                       isSelected: DynamicBinding(false),
                       isSeparatorVisible: DynamicBinding(false))
            
        ]
    }
}
