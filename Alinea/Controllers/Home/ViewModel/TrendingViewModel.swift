//
//  TrendingViewModel.swift
//  Alinea
//
//  Created by ds-mayur on 19/11/2020.
//

import UIKit

struct TrendingViewModel : ViewModelProtocol {
    
    //MARK:- Variable & Properties
    var items: [Any] = TrendingModel().getAllTrendingModel()
    private(set) lazy var trendingTableViewDelegate = TrendingTableViewDelegate(vm: self)
    
    internal var sectionInsets = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)
    
    //MARK:- Protocol Methods
    internal func getSectionTitle(_ section: Int) -> String {
        guard let trendingModel = items as? [TrendingModel] else { return "" }
        return trendingModel[section].name.value
    }
    
    internal func numberOfItems(_ section : Int) -> Int {
        guard let trendingModel = items as? [TrendingModel] else { return 0 }
        return trendingModel[section].stocks.count
    }
    
    func modelAt(_ section : Int, _ index: Int) -> Any {
        guard let trendingModel = items as? [TrendingModel] else { return [] }
        return trendingModel[section].stocks[index]
    }
    
    //MARK:- Common Methods
    
    //Fetching the image name
    internal func getImageName(_ index: Int, _ section: Int = 0) -> DynamicBinding<String> {
        let model = modelAt(section, index) as! Stocks
        return model.imageName
    }
    
    //Fetching the stock name
    internal func getStockName(_ index: Int, _ section: Int = 0) -> DynamicBinding<String> {
        let model = modelAt(section, index) as! Stocks
        return model.stockName
    }
    
    //Fetching the stock short name
    internal func getStockShortName(_ index: Int, _ section: Int = 0) -> DynamicBinding<String> {
        let model = modelAt(section, index) as! Stocks
        return model.stockShortName
    }
    
    //Fetching the stock percentage
    internal func getStockPercentage(_ index: Int, _ section: Int = 0) -> DynamicBinding<String> {
        let model = modelAt(section, index) as! Stocks
        return model.stockPercentage
    }
    
    //Fetching the isStock profitable
    internal func getIsStockProfitable(_ index: Int, _ section: Int = 0) -> DynamicBinding<IsStockInProfitEnum> {
        let model = modelAt(section, index) as! Stocks
        return model.isStockProfitable
    }
    
    
    
}
