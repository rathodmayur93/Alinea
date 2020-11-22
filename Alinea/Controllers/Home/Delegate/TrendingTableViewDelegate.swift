//
//  TrendingTableViewDelegate.swift
//  Alinea
//
//  Created by ds-mayur on 19/11/2020.
//

import UIKit

class TrendingTableViewDelegate : NSObject, UITableViewDelegate {
    
    //MARK:- Variable & Properties
    var viewModel : TrendingViewModel!
    private var bgView : UIView!
    private var sectionLabel : UILabel!
    
    //MARK:- Initializer
    init(vm : TrendingViewModel) {
        self.viewModel = vm
    }

    //MARK:- Setting up the View
    private func setupView(frame : CGRect){
        bgView = MRUiMaker.createView(viewFrame: frame, backgroundColor: .whiteColor)
        sectionLabel =  MRUiMaker.makeLabel(font: UIFont.boldSystemFont(ofSize: 16.0),
                                            color: .textColor,
                                            numberOfLines: 1,
                                            alignment: .left)
        
        //Adding the sectionLabel in bgView
        bgView.addSubview(sectionLabel)
        
        //Setting up the constraint
        setupConstraint()
    }
    
    /**
        - In this method we'll add constraint to the **BgView & Section Label**
     */
    private func setupConstraint(){
        
        //Making translatesAutoresizingMaskIntoConstraints false since we will manually positioning the objects when size changes
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false

        //Setting up the contraints
        sectionLabel.topLeft(toView: bgView, left: 16.0)
        sectionLabel.right(toView: bgView)
    }
    
    
    
    //MARK:- TableView Delegate Methods
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        //Setting up the view
        let viewFrame = CGRect(x: tableView.frame.origin.x,
                               y: tableView.frame.origin.y,
                               width: tableView.frame.width,
                               height: tableView.frame.height)
        setupView(frame: viewFrame)
        
        //Setting up the section label name
        sectionLabel.text = viewModel.getSectionTitle(section)
        
        return bgView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
}
