//
//  Appearence.swift
//  ARFaceSCNDemo
//
//  Created by Hemant Sudhanshu on 18/07/23.
//


import UIKit
import ARKit


/// Appearence of a model is saved in this form
struct Appearence{
    
    /// Array of materials which apply onto the materials of a model
    var materials = [SCNMaterial]()
    
    /// Display color of this appearence in the UI
    var displayColor = UIColor()
}
