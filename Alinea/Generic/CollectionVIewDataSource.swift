//
//  CollectionVIewDataSource.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import Foundation
import UIKit

protocol ReusableView : AnyObject {
    static var identifier : String { get }
}

class CollectionViewDataSource<CellType, ViewModel> : NSObject, UICollectionViewDataSource where CellType : UICollectionViewCell, ViewModel : ViewModelProtocol{
    
    let cellIdentifier : String
    var item : ViewModel
    let configureCell : (CellType, ViewModel, Int) -> ()
    
    init(cellIdentifier identifier : String, itemList item : ViewModel, configureCell cell : @escaping (CellType, ViewModel, Int) -> ()) {
        self.cellIdentifier = identifier
        self.item = item
        self.configureCell = cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.numberOfItems(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? CellType else {
            return UICollectionViewCell()
        }
        
        self.configureCell(cell, item, indexPath.row)
        
        return cell
    }
}
