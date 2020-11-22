//
//  BottomCollectionViewDelegate.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import UIKit

class BottomBarCollectionViewDelegate : NSObject{
    var bottomVM : BottomViewModel?
}

class BottomCollectionViewDelegate : BottomBarCollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
    //MARK:- Delegate Flow Layout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //Calculating the available padding space require
        let paddingSpace    = (bottomVM?.sectionInsets.left ?? 0.0) * CGFloat((bottomVM?.numberOfItems(0) ?? 0 + 1))
        //Calculate the available width we have for cell
        let availableWidth  = UIScreen.main.bounds.width - paddingSpace
        //Calculating the each cell width
        let widthPerItem    = availableWidth / CGFloat((bottomVM?.numberOfItems(0) ?? 0))
        
        return CGSize(width: widthPerItem, height: MRConstants.bottomBarViewHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return bottomVM?.sectionInsets ?? UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return bottomVM?.sectionInsets.left ?? 0.0
    }
    
    //MARK:- UICollectionViewDelegate Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        bottomVM?.collectionViewItemSelected(index: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        bottomVM?.collectionViewItemDeselected(index: indexPath.item)
    }
    
}
