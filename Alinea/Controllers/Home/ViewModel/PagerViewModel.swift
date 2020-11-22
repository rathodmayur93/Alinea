//
//  PagerViewModel.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import UIKit

protocol PagerSelectedDelegate {
    func selectedPager(at index : Int)
}

struct PagerViewModel : ViewModelProtocol {
    
    //MARK:- Variable & Properties
    var items: [Any] = PagerModel().getAllPagerModel()
    internal var pagerCollectionViewDelegate : PagerCollectionViewLayoutDelegate?
    internal var pagerDelegate : PagerSelectedDelegate?
    
    internal var sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    
    
    //MARK:- Initializer
    init(collectionViewDelegate : PagerCollectionViewLayoutDelegate) {
        self.pagerCollectionViewDelegate = collectionViewDelegate
    }
    
    internal func passDataToDelegateMethod(){
        pagerCollectionViewDelegate?.pagerVM = self
    }
    
    //MARK:- Protocol Methods
    func getSectionTitle(_ section: Int) -> String {
        return  ""
    }
    
    func modelAt(_ section: Int, _ index: Int) -> Any {
        let model = items[index]
        return model
    }
    
    //MARK:- Common Methods
    internal func numberOfItems(_ section : Int) -> Int{
        return items.count
    }
    
    //Fetching the imageName
    internal func getName(_ index: Int, _ section: Int = 0) -> DynamicBinding<String> {
        let model = modelAt(section, index) as! PagerModel
        return model.name
    }
    
    //Fetching the isSelected
    internal func getIsSelected(_ index: Int, _ section: Int = 0) -> DynamicBinding<Bool> {
        let model = modelAt(section, index) as! PagerModel
        return model.isSelected
    }
    
    //Fetching the isSelected
    internal func getIsSeparatorVisible(_ index: Int, _ section: Int = 0) -> DynamicBinding<Bool> {
        let model = modelAt(section, index) as! PagerModel
        return model.isSeparatorVisible
    }
    
    
    //MARK:- CollectionView Action Methods
    internal func collectionViewItemSelected(index : Int){
        
        /**
            - This if condition will make sure, wheneverr user select any tab for the first time except 0 we will make isSelectef flag for 0th index as false
            - If we dont do this then 0th index will be stay selected for all the time
         */
        if(index != 0){
            let model = modelAt(0,0) as! PagerModel
            model.isSelected.value = false
        }
        
        let model = modelAt(0, index) as! PagerModel
        model.isSelected.value = true
        
        //Passing the data to the delegate function
        pagerDelegate?.selectedPager(at: index)
    }
    
    internal func collectionViewItemDeselected(index : Int){
        let model = modelAt(0, index) as! PagerModel
        model.isSelected.value = false
    }
}
