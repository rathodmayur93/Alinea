//
//  BottomBarCollectionViewModel.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import Foundation

struct BottomBarCollectionModel {
    var name : DynamicBinding<String>!
    var imageName : DynamicBinding<String>!
    var isSelected : DynamicBinding<Bool>!
    
    private enum CodingKeys : String, CodingKey{
        case name
        case imageName
        case isSelected
    }
}

extension BottomBarCollectionModel {
    
    func getAllBottomBarCollectionModel() -> [BottomBarCollectionModel]{
        return [
            BottomBarCollectionModel(name: DynamicBinding("Home"),
                                     imageName: DynamicBinding(MRImages.home.getImageName()),
                                     isSelected: DynamicBinding(true)),
            BottomBarCollectionModel(name: DynamicBinding("Search"),
                                     imageName: DynamicBinding(MRImages.search.getImageName()),
                                     isSelected: DynamicBinding(false)),
            BottomBarCollectionModel(name: DynamicBinding("Growth"),
                                     imageName: DynamicBinding(MRImages.growth.getImageName()),
                                     isSelected: DynamicBinding(false)),
            BottomBarCollectionModel(name: DynamicBinding("People"),
                                     imageName: DynamicBinding(MRImages.people.getImageName()),
                                     isSelected: DynamicBinding(false)),
            BottomBarCollectionModel(name: DynamicBinding("Ideas"),
                                     imageName: DynamicBinding(MRImages.ideas.getImageName()),
                                     isSelected: DynamicBinding(false))
        ]
    }
}
