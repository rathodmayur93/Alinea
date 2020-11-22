//
//  TrendingTableViewCell.swift
//  Alinea
//
//  Created by ds-mayur on 19/11/2020.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {
    //MARK:- Views
    /**
        - This will create a UIView
     */
    private let bgView : UIView = {
        let view = MRUiMaker.createView(viewFrame: .zero,
                                        backgroundColor: .bottomBarSelectedColor,
                                        cornerRadius: 15,
                                        cornerMask: [.layerMaxXMaxYCorner,
                                                     .layerMaxXMinYCorner,
                                                     .layerMinXMaxYCorner,
                                                     .layerMinXMinYCorner])
        return view
    }()
    
    /**
        - This will be the stock image
     */
    private let stockIV : UIImageView = {
        let iv = MRUiMaker.makeImageView(frame: .zero,
                                         image: UIImage(systemName: "house"))
        iv.tintColor = UIColor.setColor(name: .bottomBarSelectedColor)
        return iv
    }()
    
    /**
     - This will create a stock name label
     */
    private let stockNameLabel : UILabel = {
        let label = MRUiMaker.makeLabel(text: "Stocks",
                                        font: UIFont.boldSystemFont(ofSize: 16.0),
                                        color: .textColor,
                                        numberOfLines: 1,
                                        alignment: .center)
        return label
    }()
    
    /**
     - This will create a stock mini name label
     */
    private let stockMiniNameLabel : UILabel = {
        let label = MRUiMaker.makeLabel(text: "Stocks",
                                        font: UIFont.systemFont(ofSize: 12.0),
                                        color: .subHeading,
                                        numberOfLines: 1,
                                        alignment: .center)
        return label
    }()
    /**
     - This will create a stock percentage label
     */
    private let stockPercentageLabel : UILabel = {
        let label = MRUiMaker.makeLabel(text: "+00.00",
                                        font: UIFont.boldSystemFont(ofSize: 14.0),
                                        color: .whiteColor,
                                        numberOfLines: 1,
                                        alignment: .center)
        return label
    }()
    
    //MARK:- TableView Cell UI Methods
    public func setupCell(model : TrendingViewModel, at index : Int){
        
        //Setting up the selection style to none
        self.selectionStyle = .none
        
        //Setting up the container background color
        contentView.backgroundColor = UIColor.setColor(name: .whiteColor)
        
        /**
            - Setting up the listeners on the view elements
            - Binding the view with ViewModel
            - Whenever the model gets changes it will notify the view element and view will also change depending on the model
         */
        model.getImageName(index).bind{ self.stockIV.image = UIImage(named: $0) }
        model.getStockName(index).bind{ self.stockNameLabel.text = $0 }
        model.getStockShortName(index).bind{ self.stockMiniNameLabel.text = $0 }
        model.getStockPercentage(index).bind{ self.stockPercentageLabel.text = $0 + "%" }
        model.getIsStockProfitable(index).bind{
            self.bgView.backgroundColor = UIColor.setColor(name: $0.getBackgroundColor())
            self.stockPercentageLabel.text = ($0.getBoolValue() ? "+" : "-") + (self.stockPercentageLabel.text!)
        }
        
        //Setting up the view
        setupView()
    }
    
    /**
        - In this method we will add bgView, stockLabel and imageView to the contentVIew
        - It will also add the consstraint to the required views
     */
    private func setupView(){
        
        //Adding views
        contentView.addSubview(stockIV)
        contentView.addSubview(stockNameLabel)
        contentView.addSubview(stockMiniNameLabel)
        bgView.addSubview(stockPercentageLabel)
        contentView.addSubview(bgView)
        
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        stockIV.translatesAutoresizingMaskIntoConstraints = false
        stockNameLabel.translatesAutoresizingMaskIntoConstraints = false
        stockMiniNameLabel.translatesAutoresizingMaskIntoConstraints = false
        bgView.translatesAutoresizingMaskIntoConstraints = false
        stockPercentageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Ssetting up the contraints
        setupConstraint()
    }
    
    /**
        - In this method we'll add constraint to the **stockIV**
        - We'll also add the constrain to the **stockNameLabel**
        - We'll also add the constrain to the **stockMiniNameLabel**
        - We'll also add the constrain to the **bgView**
     */
    private func setupConstraint(){
        
        //Setting up the stockIV constraint
        stockIV.left(toView: contentView, space: 16.0)
        stockIV.centerY(toView: contentView)
        stockIV.height(40.0)
        stockIV.width(40.0)
        
        //Setting up the stockNameLabel constraint
        stockNameLabel.top(toView: stockIV)
        stockNameLabel.leftRight(toView: stockIV, space: 16.0)
        
        //Setting up the stockMiniNameLabel constraint
        stockMiniNameLabel.topBottom(toView: stockNameLabel, space: 0.0)
        stockMiniNameLabel.left(toView: stockNameLabel)
        stockNameLabel.height(24.0)
        
        //Setting up the bgView Constraint
        bgView.right(toView: contentView, space: -16)
        bgView.centerY(toView: contentView)
        bgView.height(30.0)
        bgView.width(90.0)
        
        //Setting up the percentage label
        stockPercentageLabel.center(toView: bgView)
    }
}

extension TrendingTableViewCell : ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
