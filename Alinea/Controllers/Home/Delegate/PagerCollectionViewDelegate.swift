//
//  PagerCollectionViewDelegate.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import UIKit

class PagerCollectionViewDelegate : NSObject {
    var pagerVM : PagerViewModel?
}

class PagerCollectionViewLayoutDelegate : PagerCollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
    //MARK:- Delegate Flow Layout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //Calculating the available padding space require
        let paddingSpaceLeft    = (pagerVM?.sectionInsets.left ?? 0.0)  * (CGFloat(pagerVM?.numberOfItems(indexPath.section) ?? 0))
        //Calculating the available padding space require
        let paddingSpaceRight    = (pagerVM?.sectionInsets.right ?? 0.0) * (CGFloat(pagerVM?.numberOfItems(indexPath.section) ?? 0))
        //Calculate the available width we have for cell
        let availableWidth  = UIScreen.main.bounds.width - paddingSpaceLeft - paddingSpaceRight
        //Calculating the each cell width
        let widthPerItem    = availableWidth / (CGFloat(pagerVM?.numberOfItems(indexPath.section) ?? 0))
        debugPrint("Pager Width \(widthPerItem)")
        return CGSize(width: widthPerItem, height: 30.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: -20.0, bottom: 0.0, right: 0.0) //pagerVM?.sectionInsets ??
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0 //pagerVM?.sectionInsets.left ?? 
    }
    
    //MARK:- UICollectionViewDelegate Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pagerVM?.collectionViewItemSelected(index: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        pagerVM?.collectionViewItemDeselected(index: indexPath.item)
    }
    
}
