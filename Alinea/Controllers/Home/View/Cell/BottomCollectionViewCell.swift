//
//  BottomCollectionViewCell.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import UIKit

final class BottomCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Variable & Properties
    /**
        - This view will be visible for selected view only
     */
    private let selectedView : UIView = {
        let view = MRUiMaker.createView(viewFrame: .zero,
                                          backgroundColor: .whiteColor,
                                          cornerRadius: 10.0,
                                          cornerMask: [.layerMinXMinYCorner,
                                                       .layerMaxXMinYCorner])
        return view
    }()
    
    /**
        - This will be the bottomBar icons
     */
    private let imageView : UIImageView = {
        let iv = MRUiMaker.makeImageView(frame: .zero,
                                         image: UIImage(systemName: "house"))
        return iv
    }()
    
    
    //MARK:- CollectionView Cell UI Methods
    public func setupCell(model : BottomViewModel, at index : Int){
        
        /**
            - Setting up the listeners on the view elements
            - Binding the view with ViewModel
            - Whenever the model gets changes it will notify the view element and view will also change depending on the model
         */
        model.getImageName(index).bind{ self.imageView.image = UIImage(systemName: $0) }
        model.getIsSelected(index).bind {
            self.selectedView.backgroundColor = $0 ? UIColor.setColor(name: .bottomBarSelectedColor) : UIColor.setColor(name: .whiteColor)
            self.imageView.tintColor = $0 ? UIColor.setColor(name: .whiteColor) : UIColor.setColor(name: .bottomBarSelectedColor)
        }
        
        //Setting up the view
        setupView()
    }
    
    /**
        - In this method we will add selectedView and imageView to the contentVIew
        - It will also add the consstraint to the required views
     */
    private func setupView(){
        selectedView.addSubview(imageView)
        contentView.addSubview(selectedView)
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        selectedView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //Ssetting up the contraints
        setupConstraint()
    }
    
    /**
        - In this method we'll add constraint to the **selectedView**
        - We'll also add the constrain to the **imageView**
     */
    private func setupConstraint(){
        //Setting up the selectedViewConstraint
        selectedView.topLeft(toView: self.contentView)
        selectedView.right(toView: self.contentView)
        selectedView.height(MRConstants.bottomBarViewHeight)
        
        
        //Setting up the imageView into the center of the selectedView
        imageView.center(toView: selectedView)
    }
}

extension BottomCollectionViewCell : ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}
