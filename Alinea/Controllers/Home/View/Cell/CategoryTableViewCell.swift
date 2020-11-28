//
//  CategoryTableViewCell.swift
//  Alinea
//
//  Created by ds-mayur on 18/11/2020.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    //MARK:- Views
    /**
        - This will create a UIView
     */
    private let bgView : UIView = {
        let view = MRUiMaker.createView(viewFrame: .zero,
                                        backgroundColor: .textColor,
                                        cornerRadius: 40,
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
        iv.tintColor = .white
        return iv
    }()
    
    /**
     - This will create a stock name label
     */
    private let stockNameLabel : UILabel = {
        let label = MRUiMaker.makeLabel(text: "Stocks",
                                        font: UIFont.boldSystemFont(ofSize: 16.0),
                                        color: .whiteColor,
                                        numberOfLines: 1,
                                        alignment: .center)
        return label
    }()
    
    //MARK:- TableView Cell UI Methods
    public func setupCell(model : CategoryViewModel, at index : Int){
        
        //Setting up the selection style to none
        self.selectionStyle = .none
        
        //Setting up the container background color
        contentView.backgroundColor = UIColor.setColor(name: .whiteColor)
        
        /**
            - Setting up the listeners on the view elements
            - Binding the view with ViewModel
            - Whenever the model gets changes it will notify the view element and view will also change depending on the model
         */
        model.getBackgroundColor(index).bind{ self.bgView.backgroundColor = UIColor.hexStringToUIColor(hex: $0) }
        model.getImageName(index).bind{ self.stockIV.image = UIImage(systemName: $0) }
        model.getCategoryName(index).bind{ self.stockNameLabel.text = $0  }
        
        //Setting up the view
        setupView()
    }
    
    /**
        - In this method we will add bgView, stockLabel and imageView to the contentVIew
        - It will also add the consstraint to the required views
     */
    private func setupView(){
        
        //Adding views
        bgView.addSubview(stockIV)
        bgView.addSubview(stockNameLabel)
        contentView.addSubview(bgView)
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        stockIV.translatesAutoresizingMaskIntoConstraints = false
        stockNameLabel.translatesAutoresizingMaskIntoConstraints = false
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        //Ssetting up the contraints
        setupConstraint()
    }
    
    /**
        - In this method we'll add constraint to the **selectedView**
        - We'll also add the constrain to the **imageView**
     */
    private func setupConstraint(){
        
        //Setting up the bgView constraint
        bgView.topLeft(toView: contentView, top: 16.0 ,left: 16.0)
        //bgView.right(toView: contentView, space: -16.0)
        bgView.bottomRight(toView: contentView, bottom: -16.0 ,right: -16.0)
        //bgView.height(80.0)
        
        //Setting up the stockImageView constraint
        stockIV.left(toView: bgView, space: 24.0)
        stockIV.centerY(toView: bgView)
        stockIV.width(40.0)
        stockIV.height(40.0)
        
        //Setting up the stockName constraint
        stockNameLabel.leftRight(toView: stockIV, space: 16.0)
        stockNameLabel.centerY(toView: stockIV)
        stockNameLabel.height(30.0)
        
    }
}

extension CategoryTableViewCell : ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
