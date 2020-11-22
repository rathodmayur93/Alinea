//
//  UIView+Extension.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

import UIKit

extension UIView{
    func dropShadow(scale: Bool = true, radius : CGFloat = 5.0) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0.0, height: -2.0)
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        //layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: radius).cgPath
    }
    
    func addSubviews(views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    func makeEdgesCurve(radius radi : CGFloat = 5.0, corners edges : CACornerMask){
        self.layer.cornerRadius = radi
        self.layer.maskedCorners = edges
    }
    
    func setBackgroundColor(bgColor color : MRColors){
        self.backgroundColor = UIColor.setColor(name: color)
    }
    
    //MARK:- Constraints
    
    @discardableResult
    public func top(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: view.topAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func bottom(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func left(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(equalTo: view.leftAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func right(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = rightAnchor.constraint(equalTo: view.rightAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func leftRight(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = leftAnchor.constraint(equalTo: view.rightAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func bottomRight(toView view: UIView, bottom: CGFloat = 0, right: CGFloat = 0) -> [NSLayoutConstraint] {
        
        let bottomConstraint = self.bottom(toView: view, space: bottom)
        let rightConstraint = self.right(toView: view, space: right)
        
        return [bottomConstraint, rightConstraint]
    }
    
    @discardableResult
    public func bottomLeft(toView view: UIView, bottom: CGFloat = 0, left: CGFloat = 0) -> [NSLayoutConstraint] {
        
        let bottomConstraint = self.bottom(toView: view, space: bottom)
        let leftConstraint = self.left(toView: view, space: left)
        
        return [bottomConstraint, leftConstraint]
    }
    
    @discardableResult
    public func bottomTop(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(equalTo: view.topAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func topLeft(toView view: UIView, top: CGFloat = 0, left: CGFloat = 0) -> [NSLayoutConstraint] {
        
        let topConstraint = self.top(toView: view, space: top)
        let leftConstraint = self.left(toView: view, space: left)
        
        return [topConstraint, leftConstraint]
    }
    
    @discardableResult
    public func topBottom(toView view : UIView, space : CGFloat = 0) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: view.bottomAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func topRight(toView view: UIView, top: CGFloat = 0, right: CGFloat = 0) -> [NSLayoutConstraint] {
        
        let topConstraint = self.top(toView: view, space: top)
        let rightConstraint = self.right(toView: view, space: right)
        
        return [topConstraint, rightConstraint]
    }
    
    @discardableResult
    public func width(_ width: CGFloat) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalToConstant: width)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func width(toView view: UIView, multiplier: CGFloat = 1, greater: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier, constant: greater)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func height(_ height: CGFloat) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: height)
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    public func height(toView view: UIView, multiplier: CGFloat = 1, greater: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier, constant: greater)
        constraint.isActive = true
        return constraint
    }
    
    
    
    @discardableResult
    public func centerX(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
    
    public func center(toView view: UIView, space: CGFloat = 0){
        centerX(toView: view, space: space)
        centerY(toView: view, space: space)
    }
    
    @discardableResult
    public func centerY(toView view: UIView, space: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: space)
        constraint.isActive = true
        return constraint
    }
}
