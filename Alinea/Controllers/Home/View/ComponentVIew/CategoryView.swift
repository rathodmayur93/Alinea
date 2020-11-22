//
//  CategoryView.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import UIKit

class CategoryView : UIView{
    //MARK:- Variables & Properties
    private var categoryTableViewDataSource : TableViewDataSource<CategoryTableViewCell, CategoryViewModel>!
    
    //Creating Instance of the HomeViewModel
    private lazy var categoryVM : CategoryViewModel = {
        var vm = CategoryViewModel()
        return vm
    }()
    
    //MARK:- Views
    //Bottom Bar CollectionView
    private let categoryTableView : UITableView = {
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
    
    //MARK:- Setting up the UI
    private func setupView() {
        //Adding the views
        self.addSubview(categoryTableView)
        
        //Setting up the collectionView
        setupTableView()
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Setting up the contraints
        setupConstraint()
    }
    
    /**
        - In this method we'll add constraint to the **collectionView**
     */
    private func setupConstraint(){
        
        //Setting up the hamburger ImageView constraint
        categoryTableView.topLeft(toView: self)
        categoryTableView.right(toView: self)
        categoryTableView.bottom(toView: self)
    }
    
    /**
        - This method will setup the tableVIew Cell
     */
    private func setupTableView(){
        
        //Setting up the tableView footer
        categoryTableView.tableFooterView = UIView()
        
        //Registering the CollectionView Cell class
        categoryTableView.register(CategoryTableViewCell.self,
                                   forCellReuseIdentifier: CategoryTableViewCell.identifier)
        
        //Assigning the generic collectionViewDataSource insstance
        categoryTableViewDataSource = TableViewDataSource(identifier: CategoryTableViewCell.identifier,
                                                          vm: categoryVM,
                                                          configureCell:
        { (cell, model, index) in
            
            //Setting up the cell
            cell.setupCell(model: model, at: index)
        })
        
        //Setting up the dataSource & delegate method
        categoryTableView.dataSource = categoryTableViewDataSource
        
    }
}
