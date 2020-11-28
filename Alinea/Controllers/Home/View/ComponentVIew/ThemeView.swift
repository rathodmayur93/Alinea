//
//  ThemeView.swift
//  Alinea
//
//  Created by ds-mayur on 18/11/2020.
//

import UIKit

class ThemeView : UIView {
    
    //MARK:- Variables & Properties
    private var themeCollectionViewDataSource : CollectionViewDataSource<ThemeCollectionViewCell, ThemesViewModel>!
    
    //Creating Instance of the HomeViewModel
    private var themeVM : ThemesViewModel?
    
    //MARK:- Views
    
    //Bottom Bar CollectionView
    private let themeCollectionView : UICollectionView = {
        return MRUiMaker.createCollectionView(viewFrame: .zero,
                                              backgroundColor: .backgroundColor,
                                              scrollDirection: .vertical)
    }()
    
    //MARK:- Initializer
    //For using custom view in code
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Setting up the View
        setupView()
    }
    
    //For using custome view in IB
    internal required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        //Setting up the View
        setupView()
    }
    
    internal init(vm : ThemesViewModel){
        super.init(frame: .zero)
        
        self.themeVM = vm
        
        //Setting up the View
        setupView()
    }
    
    //MARK:- Setting up the UI
    private func setupView() {
        
        //Adding the views
        self.addSubview(themeCollectionView)
        themeVM?.passDataToDelegateMethod()
        
        //Setting up the collectionView
        setupCollectionView()
        
        /**
            - Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        */
        themeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        //Setting up the contraints
        setupConstraint()
    }
    
    /**
        - In this method we'll add constraint to the **collectionView**
     */
    private func setupConstraint(){
        
        //Setting up the hamburger ImageView constraint
        themeCollectionView.topLeft(toView: self, left: 16.0)
        themeCollectionView.right(toView: self, space: -16.0)
        themeCollectionView.bottom(toView: self)
    }
    
    /**
        - This method will setup the collectionView Cell
     */
    private func setupCollectionView(){
        
        //Registering the CollectionView Cell class
        themeCollectionView.register(ThemeCollectionViewCell.self,
                                      forCellWithReuseIdentifier: ThemeCollectionViewCell.identifier)
        
        //Assigning the generic collectionViewDataSource insstance
        guard let viewModel = themeVM else { return }
        themeCollectionViewDataSource = CollectionViewDataSource(cellIdentifier: ThemeCollectionViewCell.identifier,
                                                                 itemList: viewModel,
                                                                  configureCell:
        { (cell, model, index) in
            
            //Setting up the cell
            cell.setupCell(model: model, at: index)
        })
        
        //Setting up the dataSource & delegate method
        themeCollectionView.dataSource = themeCollectionViewDataSource
        themeCollectionView.delegate = themeVM?.themeCollectionViewDelegate
        
    }
    
}
