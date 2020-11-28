//
//  TableViewSectionDataSource.swift
//  Alinea
//
//  Created by ds-mayur on 19/11/2020.
//

import UIKit

class TableViewSectionDataSource<CellType, ViewModel> : NSObject, UITableViewDataSource where CellType : UITableViewCell,
                                                                                              ViewModel : ViewModelProtocol {
    
    let cellIdentifier : String
    var items : ViewModel
    let configureCell : (CellType, ViewModel, Int) -> ()
    
    init(identifier : String, vm : ViewModel, configureCell : @escaping (CellType, ViewModel, Int) -> ()) {
        self.cellIdentifier = identifier
        self.items = vm
        self.configureCell = configureCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items.getSectionTitle(section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.numberOfItems(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellType else { return UITableViewCell() }
        
        self.configureCell(cell, items, indexPath.row)
        
        return cell
    }
}
