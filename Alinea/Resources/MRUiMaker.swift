//
//  MRUiMaker.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import UIKit

struct MRUiMaker{
    
    /**
     - This function will create a basic UIView
     - You can specify the Frame of the View
     - Default background color of the view is white
     - incase you want to change the background color you can select any color from **MRColors.swift** file
     - Parameters:
     - Parameter viewFrame: This will define the size and co-ordinate of the view in frame
     - Parameter backgroundColor: MRColor of the view's background
     - Parameter cornerRadius: This will make edges of the view to be circular, you can pass the circular radius value in this paramter
     - Parameter cornerMask: It will mask the edges of the UIView, It's of type CACornerMask
     - Returns: This function will create & return a **UIView**,
     */
    static func createView(viewFrame : CGRect,
                    backgroundColor color: MRColors = .whiteColor,
                    cornerRadius radi : CGFloat = 0.0,
                    cornerMask mask : CACornerMask = [.layerMaxXMaxYCorner,
                                                      .layerMaxXMinYCorner,
                                                      .layerMinXMaxYCorner,
                                                      .layerMinXMinYCorner]) -> UIView
    {
        let view = UIView(frame: viewFrame)
        view.setBackgroundColor(bgColor: color)
        view.makeEdgesCurve(radius: radi, corners: mask)
        return view
    }
    
    /**
        - This function will create a basic UICollectionView
        - You can specify the Frame of the View
        - Default background color of the view is white
        - incase you want to change the background color you can select any color from **MRColors.swift** file
        - Parameters:
        - Parameter viewFrame: This will define the size and co-ordinate of the view in frame
        - Parameter backgroundColor: MRColor of the view's background
        - Parameter scrollDirection: Define the scroll direction of the collectionView
        - Returns: This function will create & return a **UICollectionView**,
     */
    static func createCollectionView(viewFrame : CGRect,
                                     backgroundColor color : MRColors = .whiteColor,
                                     scrollDirection direction : UICollectionView.ScrollDirection) -> UICollectionView {
        
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = direction
        let collectionView = UICollectionView(frame: viewFrame, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = UIColor.setColor(name: color)
        return collectionView
    }
    
    /**
        - This function will create a UILabel
        - You can specify the Frame of the UILabel
        - Default text color of the view is black
        - incase you want to change the text color you can select any color from **MRColors.swift** file
        - Parameters:
        - Parameter text: Pass the text you want to set into the label
        - Parameter font: Pass specific font you want to use for label **default is  System Font with Font Size 15**
        - Parameter color: Pass specific color you want to use for label text **default is black**
        - Parameter numberOfLines: Pass specific number of lines UIlabel can accomodate **default value is 1**
        - Parameter alignment: Pass specific  alignment of text in UILabel **default value is left**
        - Returns: This function will create & return a **UICollectionView**,
     */
    static func makeLabel(text: String? = nil,
                          font: UIFont = .systemFont(ofSize: 15),
                          color: MRColors = .textColor,
                          numberOfLines: Int = 1,
                          alignment: NSTextAlignment = .left) -> UILabel
    {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.textColor = UIColor.setColor(name: color)
        label.text = text
        label.numberOfLines = numberOfLines
        label.textAlignment = alignment
        return label
    }
    
    /**
        - This function will create a UIImageVIew
        - You can specify the Frame of the UIImageVIew
        - Parameters:
        - Parameter frame: This will define the size and co-ordinate of the ImageView in frame
        - Parameter image: Pass the image which you want to show in UIImageView
        - Parameter contentMode: You can specify the different content mode but default content mode is **scaleAspectFit**
        - Returns: This function will create & return a **UIImageView**,
     */
    static func makeImageView(frame : CGRect,
                              image: UIImage? = nil,
                              contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImageView {
        
        let iv = UIImageView(frame: frame)
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = contentMode
        iv.clipsToBounds = true
        return iv
    }
    
    /**
        - This function will create a basic UITableView
        - You can specify the Frame of the View
        - Default background color of the view is white
        - incase you want to change the background color you can select any color from **MRColors.swift** file
        - Parameters:
        - Parameter viewFrame: This will define the size and co-ordinate of the view in frame
        - Parameter backgroundColor: MRColor of the view's backgroun
        - Returns: This function will create & return a **UICollectionView**,
     */
    static func createTableView(viewFrame : CGRect,
                                backgroundColor color : MRColors = .whiteColor) -> UITableView {
        
        let tableView = UITableView(frame: viewFrame)
        tableView.backgroundColor = UIColor.setColor(name: color)
        return tableView
    }
}
