//
//  HomeViewModel.swift
//  Alinea
//
//  Created by ds-mayur on 15/11/2020.
//

import UIKit

struct BottomViewModel : ViewModelProtocol {
    
    //MARK:- Variable & Properties
    var items: [Any] = BottomBarCollectionModel().getAllBottomBarCollectionModel()
    private var bottomBarCollectionViewDelegate : BottomBarCollectionViewDelegate?
    
    internal var sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    
    
    //MARK:- Initializer
    init(delegate : BottomBarCollectionViewDelegate) {
        self.bottomBarCollectionViewDelegate = delegate
    }

    //MARK:- Protocol Methods
    func getSectionTitle(_ section: Int) -> String {
        return ""
    }
    
    func modelAt(_ section: Int, _ index: Int) -> Any {
        let model = items[index]
        return model
    }
    
    internal func numberOfItems(_ section : Int) -> Int{
        return items.count
    }
    
    //MARK:- Common Methods
    internal func passDataToDelegateMethod(){
        bottomBarCollectionViewDelegate?.bottomVM = self
    }
    
    //Fetching the imageName
    internal func getImageName(_ index: Int, _ section: Int = 0) -> DynamicBinding<String> {
        let model = modelAt(section, index) as! BottomBarCollectionModel
        return model.imageName
    }
    
    //Fetching the isSelected
    internal func getIsSelected(_ index: Int, _ section: Int = 0) -> DynamicBinding<Bool> {
        let model = modelAt(section, index) as! BottomBarCollectionModel
        return model.isSelected
    }
    
    //MARK:- CollectionView Action Methods
    internal func collectionViewItemSelected(index : Int){
        
        /**
            - This if condition will make sure, wheneverr user select any tab for the first time except 0 we will make isSelectef flag for 0th index as false
            - If we dont do this then 0th index will be stay selected for all the time
         */
        if(index != 0){
            let model = modelAt(0, 0) as! BottomBarCollectionModel
            model.isSelected.value = false
        }
        
        let model = modelAt(0, index) as! BottomBarCollectionModel
        model.isSelected.value = true
        //homeVMCallbackDelegate?.bottomBarCollectionItemSelected()
    }
    
    internal func collectionViewItemDeselected(index : Int){
        let model = modelAt(0, index) as! BottomBarCollectionModel
        model.isSelected.value = false
    }
}
