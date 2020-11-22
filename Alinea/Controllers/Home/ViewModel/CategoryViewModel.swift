//
//  CategoryViewModel.swift
//  Alinea
//
//  Created by ds-mayur on 18/11/2020.
//

import UIKit

struct CategoryViewModel : ViewModelProtocol {
    
    //MARK:- Variable & Properties
    var items: [Any] = CategoryModel().getAllCategoryModel()
    internal var sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    
    //MARK:- Protocol Methods
    internal func numberOfItems(_ section : Int) -> Int{
        return items.count
    }
    
    func getSectionTitle(_ section: Int) -> String {
        return ""
    }
    
    internal func modelAt(_ section: Int, _ index: Int) -> Any {
        let model = items[index]
        return model
    }
    
    //MARK:- Common Methods
    
    //Fetching the categoryName
    internal func getCategoryName(_ index: Int, _ section: Int = 0) -> DynamicBinding<String> {
        let model = modelAt(section, index) as! CategoryModel
        return model.name
    }
    
    //Fetching the imageName
    internal func getImageName(_ index: Int, _ section: Int = 0) -> DynamicBinding<String> {
        let model = modelAt(section, index) as! CategoryModel
        return model.imageName
    }
    
    //Fetching the backgroundColor
    internal func getBackgroundColor(_ index: Int, _ section: Int = 0) -> DynamicBinding<String> {
        let model = modelAt(section, index) as! CategoryModel
        return model.backgroundColor
    }
}
