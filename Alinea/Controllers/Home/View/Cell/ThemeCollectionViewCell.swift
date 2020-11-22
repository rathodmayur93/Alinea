//
//  ThemeCollectionViewCell.swift
//  Alinea
//
//  Created by ds-mayur on 18/11/2020.
//

import UIKit

class ThemeCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Views
    /**
        - This will create a UIView
     */
    private let bgView : UIView = {
        let view = MRUiMaker.createView(viewFrame: .zero,
                                        backgroundColor: .themeBgColor,
                                        cornerRadius: 10,
                                        cornerMask: [.layerMaxXMaxYCorner,
                                                     .layerMaxXMinYCorner,
                                                     .layerMinXMaxYCorner,
                                                     .layerMinXMinYCorner])
        view.layer.borderWidth = 2.0
        view.layer.borderColor = UIColor.setColor(name: .themeBgBorderColor).cgColor
        return view
    }()
    
    /**
        - This will be the themes image
     */
    private let themeIV : UIImageView = {
        let iv = MRUiMaker.makeImageView(frame: .zero,
                                         image: UIImage(systemName: "house"))
        iv.tintColor = UIColor.setColor(name: .bottomBarSelectedColor)
        return iv
    }()
    
    /**
     - This will create a theme name label
     */
    private let themeNameLabel : UILabel = {
        let label = MRUiMaker.makeLabel(text: "Stocks",
                                        font: UIFont.boldSystemFont(ofSize: 16.0),
                                        color: .textColor,
                                        numberOfLines: 0,
                                        alignment: .center)
        return label
    }()
    
    //MARK:- CollectionView Cell UI Methods
    public func setupCell(model : ThemesViewModel, at index : Int){
        
        /**
            - Setting up the listeners on the view elements
            - Binding the view with ViewModel
            - Whenever the model gets changes it will notify the view element and view will also change depending on the model
         */
        
        model.getImageName(index).bind{ self.themeIV.image = UIImage(named: $0) }
        model.getName(index).bind{ self.themeNameLabel.text = $0 }
        
        //Setting up the view
        setupView()
    }
    
    /**
        - In this method we will add bgView, stockLabel and imageView to the contentVIew
        - It will also add the consstraint to the required views
     */
    private func setupView(){
        
        //Adding views
        bgView.addSubview(themeIV)
        bgView.addSubview(themeNameLabel)
        contentView.addSubview(bgView)
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        themeIV.translatesAutoresizingMaskIntoConstraints = false
        themeNameLabel.translatesAutoresizingMaskIntoConstraints = false
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
        bgView.topLeft(toView: contentView)
        //bgView.right(toView: contentView, space: -16.0)
        bgView.bottomRight(toView: contentView)
        
        //Setting up the stockImageView constraint
        themeIV.top(toView: bgView, space: 16.0)
        themeIV.centerX(toView: bgView)
        themeIV.width(toView: bgView, multiplier: 0.5)
        themeIV.height(toView: bgView, multiplier: 0.5)
        
        //Setting up the stockName constraint
        themeNameLabel.bottom(toView: bgView, space: -8.0)
        //themeNameLabel.centerX(toView: bgView)
        themeNameLabel.left(toView: bgView, space: 8.0)
        themeNameLabel.right(toView: bgView, space: -8.0)
        themeNameLabel.height(40.0)
        
    }
}
extension ThemeCollectionViewCell : ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
