//
//  Extensions.swift
//  ARFaceSCNDemo
//
//  Created by Hemant Sudhanshu on 18/07/23.
//

import UIKit
import ARKit
import SceneKit
import Foundation


extension UIColor {
    
    /// UIColor initialiser from rgb values
    /// - Parameter red: red value
    /// - Parameter green: green value
    /// - Parameter blue: blue value
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


// MARK: - It is made to make giving names to notifications easier
extension Notification.Name {
    /// When generic error like incorrec JSON, server down occurs
    static let notificationNameGenericError = Notification.Name("notificationNameGenericError")
    
    /// When internet is off
    static let notificationNameInternetOFF = Notification.Name("notificationNameInternetOFF")
    
    /// When internet is on
    static let notificationNameInternetON = Notification.Name("notificationNameInternetON")
}

extension SCNMatrix4 {
    /**
     Create a 4x4 matrix from CGAffineTransform, which represents a 3x3 matrix
     but stores only the 6 elements needed for 2D affine transformations.
     
     [ a  b  0 ]     [ a  b  0  0 ]
     [ c  d  0 ]  -> [ c  d  0  0 ]
     [ tx ty 1 ]     [ 0  0  1  0 ]
     .               [ tx ty 0  1 ]
     
     Used for transforming texture coordinates in the shader modifier.
     (Needs to be SCNMatrix4, not SIMD float4x4, for passing to shader modifier via KVC.)
     */
    init(_ affineTransform: CGAffineTransform) {
        self.init()
        m11 = Float(affineTransform.a)
        m12 = Float(affineTransform.b)
        m21 = Float(affineTransform.c)
        m22 = Float(affineTransform.d)
        m41 = Float(affineTransform.tx)
        m42 = Float(affineTransform.ty)
        m33 = 1
        m44 = 1
    }
}

extension SCNReferenceNode {
    convenience init(named resourceName: String, loadImmediately: Bool = true) {
      print(resourceName)
//      if(resourceName == "glassesUSDZ"){
        let url = Bundle.main.url(forResource: resourceName, withExtension: "usdz")!
        self.init(url: url)!
        if loadImmediately {
            self.load()
        }
//      }
//      else {
//        let url = Bundle.main.url(forResource: resourceName, withExtension: "scn", subdirectory: "SceneKitModels.scnassets")!
//        self.init(url: url)!
//        if loadImmediately {
//            self.load()
//        }
//      }
    }
}

