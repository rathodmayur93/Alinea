//
//  ThemeCollectionViewDelegate.swift
//  Alinea
//
//  Created by ds-mayur on 18/11/2020.
//

import UIKit

class ThemeCollectionViewDelegate : NSObject {
    var themeVM : ThemesViewModel?
}

class ThemeCollectionViewLayoutDelegate : ThemeCollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    //MARK:- Delegate Flow Layout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //Calculating the available padding space require
        let paddingSpaceLeft    = (themeVM?.sectionInsets.left ?? 0.0) * MRConstants.themeViewItemCount
        //Calculating the available padding space require
        let paddingSpaceRight    = (themeVM?.sectionInsets.right ?? 0.0) * MRConstants.themeViewItemCount
        //Calculate the available width we have for cell
        let availableWidth  = collectionView.bounds.width - paddingSpaceLeft - paddingSpaceRight
        //Calculating the each cell width
        let widthPerItem    = availableWidth / MRConstants.themeViewItemCount
        debugPrint("Pager Width 2 \(widthPerItem)")
        return CGSize(width: widthPerItem, height: widthPerItem * 1.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return themeVM?.sectionInsets ?? UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0) //
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24.0
    }
}
