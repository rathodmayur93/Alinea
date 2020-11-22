//
//  TrendingModel.swift
//  Alinea
//
//  Created by ds-mayur on 19/11/2020.
//

import Foundation

enum IsStockInProfitEnum : Decodable {
    case profitable
    case nonProfitable
    
    init(from decoder: Decoder) throws {
        try self.init(from: decoder)
    }
    
    internal func getBackgroundColor() -> MRColors{
        switch self {
        case .profitable:
            return .profitableColor
        case .nonProfitable:
            return .nonProfitableColor
        }
    }
    
    internal func getBoolValue() -> Bool{
        switch self {
        case .profitable:
            return true
        case .nonProfitable:
            return false
        }
    }
}

protocol SectionModelProtocol {
    var name : DynamicBinding<String>! { get }
}

struct TrendingModel : SectionModelProtocol {
    var name: DynamicBinding<String>!
    var stocks : [Stocks]!
}

struct Stocks {
    var imageName : DynamicBinding<String>!
    var stockName : DynamicBinding<String>!
    var stockShortName : DynamicBinding<String>!
    var stockPercentage : DynamicBinding<String>!
    var isStockProfitable : DynamicBinding<IsStockInProfitEnum>!
}

extension Stocks {
    
    internal func getAllStocksTopGainers() -> [Stocks] {
        return [
            Stocks(imageName: DynamicBinding("medifast"),
                   stockName: DynamicBinding("Medifast"),
                   stockShortName: DynamicBinding("MEDI"),
                   stockPercentage: DynamicBinding("50.78"),
                   isStockProfitable: DynamicBinding(IsStockInProfitEnum.profitable)),
            Stocks(imageName: DynamicBinding("pinterest"),
                   stockName: DynamicBinding("Pinterest"),
                   stockShortName: DynamicBinding("PINS"),
                   stockPercentage: DynamicBinding("4.77"),
                   isStockProfitable: DynamicBinding(IsStockInProfitEnum.nonProfitable)),
            Stocks(imageName: DynamicBinding("slack"),
                   stockName: DynamicBinding("Slack Technologies"),
                   stockShortName: DynamicBinding("WORK"),
                   stockPercentage: DynamicBinding("5.99"),
                   isStockProfitable: DynamicBinding(IsStockInProfitEnum.nonProfitable)),
            Stocks(imageName: DynamicBinding("evoqua"),
                   stockName: DynamicBinding("Evoqua Water"),
                   stockShortName: DynamicBinding("AQUA"),
                   stockPercentage: DynamicBinding("5.99"),
                   isStockProfitable: DynamicBinding(IsStockInProfitEnum.profitable))
        ]
    }
    
    internal func getAllStocksTopSeller() -> [Stocks] {
        return [
            Stocks(imageName: DynamicBinding("slack"),
                   stockName: DynamicBinding("Slack Technologies"),
                   stockShortName: DynamicBinding("WORK"),
                   stockPercentage: DynamicBinding("5.99"),
                   isStockProfitable: DynamicBinding(IsStockInProfitEnum.nonProfitable)),
            Stocks(imageName: DynamicBinding("evoqua"),
                   stockName: DynamicBinding("Evoqua Water"),
                   stockShortName: DynamicBinding("AQUA"),
                   stockPercentage: DynamicBinding("5.99"),
                   isStockProfitable: DynamicBinding(IsStockInProfitEnum.profitable))
        ]
    }
}

extension TrendingModel {
    
    internal func getAllTrendingModel() -> [TrendingModel]{
        return [
            TrendingModel(name: DynamicBinding("Top Gainers"), stocks: Stocks().getAllStocksTopGainers()),
            TrendingModel(name: DynamicBinding("Top Sellers"), stocks: Stocks().getAllStocksTopSeller())
        ]
    }
}
