//
//  TableViewDataSource.swift
//  Alinea
//
//  Created by ds-mayur on 18/11/2020.
//

import Foundation
import UIKit

class TableViewDataSource<CellType, ViewModel> : NSObject, UITableViewDataSource where CellType : UITableViewCell, ViewModel: ViewModelProtocol {
    
    let cellIdentifier : String
    var items : ViewModel
    let configureCell : (CellType, ViewModel, Int) -> ()
    
    init(identifier : String, vm : ViewModel, configureCell : @escaping (CellType, ViewModel, Int) -> ()) {
        self.cellIdentifier = identifier
        self.items = vm
        self.configureCell = configureCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
