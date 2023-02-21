//
//  Extentions.swift
//  ODC
//
//  Created by Mohamed Khaled on 19/02/2023.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

extension UIView {
    // available from iOS 11.0
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        self.layer.cornerRadius = radius
        var cornerMask = CACornerMask()
        if corners.contains(.topLeft) { cornerMask.insert(.layerMinXMinYCorner) }
        if corners.contains(.topRight) { cornerMask.insert(.layerMaxXMinYCorner) }
        if corners.contains(.bottomLeft) { cornerMask.insert(.layerMinXMaxYCorner) }
        if corners.contains(.bottomRight) { cornerMask.insert(.layerMaxXMaxYCorner) }
        self.layer.maskedCorners = cornerMask
    }
}

extension UIViewController{
    
    
    func navigate(storyBoard:String = "Main", _ ID:String ){
        
        let storyboard = UIStoryboard(name: storyBoard, bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: ID)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func popScreen(){
        navigationController?.popViewController(animated: true)
    }
    
}
