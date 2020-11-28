//
//  PagerCollectionViewCell.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import UIKit

class PagerCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Views
    /**
        - This will create a pager label
     */
    private let headingLabel : UILabel = {
        let label = MRUiMaker.makeLabel(text: "Category",
                                        font: UIFont.boldSystemFont(ofSize: 14.0),
                                        color: MRColors.textColor,
                                        numberOfLines: 1,
                                        alignment: .center)
        return label
    }()
    
    /**
        - This view will be visible for selected view only
     */
    private let selectedView : UIView = {
        let view = MRUiMaker.createView(viewFrame: .zero,
                                          backgroundColor: .backgroundColor,
                                          cornerRadius: 0.0,
                                          cornerMask: [.layerMinXMinYCorner,
                                                       .layerMaxXMinYCorner,
                                                       .layerMaxXMinYCorner,
                                                       .layerMaxXMaxYCorner])
        return view
    }()
    
    /**
        - This will create a separator view
     */
    private let separatorView : UIView = {
        
        let view = MRUiMaker.createView(viewFrame: .zero,
                                          backgroundColor: .separatorColor)
        return view
    }()
    
    //MARK:- CollectionView Cell UI Methods
    public func setupCell(model : PagerViewModel, at index : Int){
        
        /**
            - Setting up the listeners on the view elements
            - Binding the view with ViewModel
            - Whenever the model gets changes it will notify the view element and view will also change depending on the model
         */
        model.getName(index).bind{ self.headingLabel.text = $0 }
        model.getIsSelected(index).bind{
            //Setting up the background color of the selectedView
            self.selectedView.backgroundColor = $0 ? UIColor.setColor(name: .bottomBarSelectedColor) : UIColor.setColor(name: .backgroundColor)
            
            //Change the text color if it's selected
            self.headingLabel.textColor = $0 ? UIColor.setColor(name: .bottomBarSelectedColor) : UIColor.setColor(name: .textColor)
        }
        model.getIsSeparatorVisible(index).bind {
            self.separatorView.isHidden = !$0
        }
        
        //Setting up the view
        setupView()
    }
    
    /**
        - In this method we will add selectedView and imageView to the contentVIew
        - It will also add the consstraint to the required views
     */
    private func setupView(){
        contentView.addSubview(headingLabel)
        contentView.addSubview(selectedView)
        contentView.addSubview(separatorView)
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        headingLabel.translatesAutoresizingMaskIntoConstraints = false
        selectedView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        //Ssetting up the contraints
        setupConstraint()
    }
    
    /**
        - In this method we'll add constraint to the **selectedView**
        - We'll also add the constrain to the **imageView**
     */
    private func setupConstraint(){
        
        //Setting up the headingLabel constraint
        headingLabel.center(toView: contentView)
        
        //Setting up the selectedView constraint
        selectedView.topBottom(toView: headingLabel, space: 4.0)
        selectedView.left(toView: headingLabel)
        selectedView.right(toView: headingLabel)
        selectedView.height(3.0)
        
        //Setting up the separator constraint
        separatorView.topRight(toView: contentView, top: 8.0)
        separatorView.bottom(toView: contentView, space: -8.0)
        separatorView.width(1.0)
    }
}

extension PagerCollectionViewCell : ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
