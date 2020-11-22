//
//  PagerView.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import UIKit

class PagerView : UIView {
    
    //MARK:- Variables & Properties
    private var pagerCollectionViewDataSource : CollectionViewDataSource<PagerCollectionViewCell, PagerViewModel>!
    
    private var pagerVM : PagerViewModel?
    
    //MARK:- Views
    
    //Bottom Bar CollectionView
    private let pagerCollectionView : UICollectionView = {
        return MRUiMaker.createCollectionView(viewFrame: .zero,
                                              backgroundColor: .whiteColor,
                                              scrollDirection: .horizontal)
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
    
    internal init(vm : PagerViewModel){
        super.init(frame: .zero)
        
        self.pagerVM = vm
        
        //Setting up the View
        setupView()
    }
    
    //MARK:- Setting up the UI
    private func setupView() {
        
        //Adding the views
        self.addSubview(pagerCollectionView)
        pagerVM?.passDataToDelegateMethod()
        
        //Setting up the collectionView
        setupCollectionView()
        
        /**
            - Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        */
        pagerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        //Setting up the contraints
        setupConstraint()
    }
    
    /**
        - In this method we'll add constraint to the **collectionView**
     */
    private func setupConstraint(){
        
        //Setting up the hamburger ImageView constraint
        pagerCollectionView.topLeft(toView: self)
        pagerCollectionView.right(toView: self)
        pagerCollectionView.height(MRConstants.pagerViewHeight)
    }
    
    /**
        - This method will setup the collectionView Cell
     */
    private func setupCollectionView(){
        
        //Disable the scrolling
        pagerCollectionView.isScrollEnabled = false
        
        //Registering the CollectionView Cell class
        pagerCollectionView.register(PagerCollectionViewCell.self,
                                      forCellWithReuseIdentifier: PagerCollectionViewCell.identifier)
        
        //Assigning the generic collectionViewDataSource insstance
        guard let viewModel = pagerVM else { return }
        pagerCollectionViewDataSource = CollectionViewDataSource(cellIdentifier: PagerCollectionViewCell.identifier,
                                                                  itemList: viewModel,
                                                                  configureCell:
        { (cell, model, index) in
            
            //Setting up the cell
            cell.setupCell(model: model, at: index)
        })
        
        //Setting up the dataSource & delegate method
        pagerCollectionView.dataSource = pagerCollectionViewDataSource
        pagerCollectionView.delegate = pagerVM?.pagerCollectionViewDelegate
        
    }
}
