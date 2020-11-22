//
//  TopView.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import UIKit

class TopView : UIView {
    
    //MARK:- Variable & Initializers
    /**
        - This will be the hamburger icon
     */
    private let hamburgerIV : UIImageView = {
        let iv = MRUiMaker.makeImageView(frame: .zero,
                                         image: UIImage(named: MRImages.hamburgerMenu.getImageName()))
        return iv
    }()
    
    /**
        - This will be the notification icon
     */
    private let notificationIV : UIImageView = {
        let iv = MRUiMaker.makeImageView(frame: .zero,
                                         image: UIImage(systemName: MRImages.notification.getImageName()))
        iv.tintColor = UIColor.setColor(name: .textColor)
        return iv
    }()
    
    /**
        - This will be the label **Explore**
     */
    private let exploreLabel : UILabel = {
        let label = MRUiMaker.makeLabel(text: "Explore",
                                        font: UIFont.boldSystemFont(ofSize: 18.0),
                                        color: MRColors.textColor,
                                        numberOfLines: 1,
                                        alignment: .center)
        return label
    }()
    
    
    //MARK:- Initializer
    
    //For using custom view in code
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Setting up the View
        setupView()
    }
    
    //For using custome view in IB
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        //Setting up the View
        setupView()
    }
    
    //MARK:- Setting up the UI
    private func setupView() {
        
        //Adding the views
        self.addSubview(hamburgerIV)
        self.addSubview(notificationIV)
        self.addSubview(exploreLabel)
        
        /**
            - Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        */
        hamburgerIV.translatesAutoresizingMaskIntoConstraints = false
        notificationIV.translatesAutoresizingMaskIntoConstraints = false
        exploreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Setting up the contraints
        setupConstraint()
    }
    
    /**
        - In this method we'll add constraint to the **hamburgerIV**
        - We'll also add the constrain to the **notificationIV**
        - We'll also add the constrain to the **exploreLabel**
     */
    private func setupConstraint(){
        
        //Setting up the hamburger ImageView constraint
        hamburgerIV.topLeft(toView: self)
        hamburgerIV.width(20.0)
        hamburgerIV.height(20.0)
        
        //Setting up the Notificatino ImageView Constraint
        notificationIV.topRight(toView: self)
        notificationIV.width(20.0)
        notificationIV.height(20.0)
        
        //Setting up the Export Label Constraint
        exploreLabel.left(toView: hamburgerIV)
        exploreLabel.right(toView: notificationIV)
        exploreLabel.top(toView: self)
        exploreLabel.centerY(toView: hamburgerIV)
    }
}
