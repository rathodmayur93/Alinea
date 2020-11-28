//
//  TrendingViewModel.swift
//  Alinea
//
//  Created by ds-mayur on 18/11/2020.
//

import UIKit

struct ThemesViewModel : ViewModelProtocol {

    //MARK:- Variable & Properties
    var items: [Any] = ThemesModel().getAllThemeModel()
    internal var themeCollectionViewDelegate : ThemeCollectionViewLayoutDelegate?
    
    internal var sectionInsets = UIEdgeInsets(top: 8.0, left: 12.0, bottom: 8.0, right: 12.0)
    
    //MARK:- Initializer
    init(delegate : ThemeCollectionViewLayoutDelegate) {
        self.themeCollectionViewDelegate = delegate
    }
    
    //MARK:- Protocol Method
    func getSectionTitle(_ section: Int) -> String {
        return ""
    }
    
    func modelAt(_ section: Int, _ index: Int) -> Any {
        let model = items[index]
        return model
    }
    
    //MARK:- Common Functions
    internal func passDataToDelegateMethod(){
        themeCollectionViewDelegate?.themeVM = self
    }
    
    internal func numberOfItems(_ section : Int) -> Int{
        return items.count
    }
    
    //Fetching the name
    internal func getName(_ index: Int, _ section: Int = 0) -> DynamicBinding<String> {
        let model = modelAt(section, index) as! ThemesModel
        return model.name
    }
    
    //Fetching the imageName
    internal func getImageName(_ index: Int, _ section: Int = 0) -> DynamicBinding<String> {
        let model = modelAt(section, index) as! ThemesModel
        return model.imageName
    }
}
