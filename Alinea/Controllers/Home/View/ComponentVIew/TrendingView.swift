//
//  TrendingView.swift
//  Alinea
//
//  Created by ds-mayur on 19/11/2020.
//

import UIKit

class TrendingView : UIView{
    
    //MARK:- Variables & Properties
    private var trendinigTableViewDataSource : TableViewSectionDataSource<TrendingTableViewCell, TrendingViewModel>!
    
    //Creating Instance of the HomeViewModel
    private var trendingVM : TrendingViewModel?
    
    //MARK:- Views
    //Bottom Bar CollectionView
    private let trendingTableView : UITableView = {
        return MRUiMaker.createTableView(viewFrame: .zero,
                                         backgroundColor: .backgroundColor)
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
    
    internal init(vm : TrendingViewModel){
        super.init(frame: .zero)
        
        self.trendingVM = vm
        
        //Setting up the View
        setupView()
    }
    
    //MARK:- Setting up the UI
    private func setupView() {
        //Adding the views
        self.addSubview(trendingTableView)
        //trendingVM.passDataToDelegateMethod()
        
        //Setting up the collectionView
        setupTableView()
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        trendingTableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Setting up the contraints
        setupConstraint()
    }
    
    /**
        - In this method we'll add constraint to the **collectionView**
     */
    private func setupConstraint(){
        
        //Setting up the hamburger ImageView constraint
        trendingTableView.topLeft(toView: self)
        trendingTableView.right(toView: self)
        trendingTableView.bottom(toView: self)
    }
    
    /**
        - This method will setup the tableVIew Cell
     */
    private func setupTableView(){
        
        //Setting up the tableView footer
        trendingTableView.tableFooterView = UIView()
        trendingTableView.backgroundColor = UIColor.setColor(name: .backgroundColor)
        
        
        //Registering the CollectionView Cell class
        trendingTableView.register(TrendingTableViewCell.self,
                                   forCellReuseIdentifier: TrendingTableViewCell.identifier)
        
        //Assigning the generic collectionViewDataSource insstance
        guard let viewModel = trendingVM else { return }
        trendinigTableViewDataSource = TableViewSectionDataSource(identifier: TrendingTableViewCell.identifier,
                                                                  vm: viewModel,
                                                                  configureCell:
        { (cell, viewModel, index) in
            
            //Setting up the cell
            cell.setupCell(model: viewModel, at: index)
        })
        
        //Setting up the dataSource & delegate method
        trendingTableView.dataSource = trendinigTableViewDataSource
        trendingTableView.delegate = trendingVM?.trendingTableViewDelegate
    }
}
