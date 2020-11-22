//
//  BottomVIew.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import UIKit

class BottomView : UIView {
    
    //MARK:- Variables & Properties
    private var bottomCollectionViewDataSource : CollectionViewDataSource<BottomCollectionViewCell, BottomViewModel>!
    private var dataSourceDelegate = BottomCollectionViewDelegate()
    
    //MARK:- Views
    //Bottom Bar View
    private let bottomTabBarView : UIView = {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let posY = height - MRConstants.bottomBarViewHeight
        let viewFrame = CGRect(x: 0, y: posY, width: width, height: MRConstants.bottomBarViewHeight)
        
        let view = MRUiMaker.createView(viewFrame: .zero,
                                          backgroundColor: MRColors.whiteColor,
                                          cornerRadius: MRConstants.bottomBarViewRadius,
                                          cornerMask: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        view.dropShadow(scale: true, radius: MRConstants.bottomBarShadowRadius)
        return view
    }()
    
    //Bottom Bar CollectionView
    private let bottomCollectionView : UICollectionView = {
        return MRUiMaker.createCollectionView(viewFrame: .zero, scrollDirection: .horizontal)
    }()
    
    //Creating Instance of the HomeViewModel
    private lazy var bottomVM : BottomViewModel = {
        var vm = BottomViewModel(delegate: dataSourceDelegate)
        vm.passDataToDelegateMethod()
        return vm
    }()

    
    //MARK:- Intializers
    
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
    
    //MARK:- UI Methods
    private func setupView(){
        
        //Adding the bottomView
        bottomTabBarView.addSubview(bottomCollectionView)
        self.addSubview(bottomTabBarView)
        
        //Setting up the collectionView
        setupCollectionView()
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        bottomTabBarView.translatesAutoresizingMaskIntoConstraints = false
        bottomCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        //Setting up the contraints
        setupConstraint()
    }
    
    private func setupCollectionView(){
        
        //Registering the CollectionView Cell class
        bottomCollectionView.register(BottomCollectionViewCell.self,
                                      forCellWithReuseIdentifier: BottomCollectionViewCell.identifier)
        
        //Assigning the generic collectionViewDataSource insstance
        bottomCollectionViewDataSource = CollectionViewDataSource(cellIdentifier: BottomCollectionViewCell.identifier,
                                                                  itemList: bottomVM,
                                                                  configureCell:
        { (cell, model, index) in
            
            //Setting up the cell
            cell.setupCell(model: model, at: index)
        })
        
        //Setting up the dataSource & delegate method
        bottomCollectionView.dataSource = bottomCollectionViewDataSource
        bottomCollectionView.delegate = dataSourceDelegate
        
    }
    
    /**
        - Setting up the bottomTabBarView constraints
        - bottomTabBarView will have bottomLeft, bottomRight & Height Constraint
        - bottomTabBarView will align constraints to the parent view
        - Setting up the bottomTabBarCollectionView constraints
        - bottomTabBarCollectionView will have bottomLeft, bottomRight & Height Constraint
        - bottomTabBarCollectionView will align constraints to the bottomTabBarView
     */
    private func setupConstraint(){
        
        //Setting up the bottomTabBarView constarint
        bottomTabBarView.bottomLeft(toView: self)
        bottomTabBarView.bottomRight(toView: self)
        bottomTabBarView.height(UIDevice.current.isNodgeDisplay ? MRConstants.bottomBarViewNodgeDisplayHeight : MRConstants.bottomBarViewHeight)

        //Setting up the collectinonView Constarint
        bottomCollectionView.left(toView: bottomTabBarView)
        bottomCollectionView.top(toView: bottomTabBarView)
        bottomCollectionView.right(toView: bottomTabBarView)
        bottomCollectionView.bottom(toView: bottomTabBarView)
    }
}
