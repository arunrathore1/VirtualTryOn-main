//
//  Model3D.swift
//  ARFaceSCNDemo
//
//  Created by Hemant Sudhanshu on 18/07/23.
//

import Foundation
import ARKit
import SceneKit

/// A 3D model is saved in this form
struct Model3D {
    
    /// Name of the model. Acts as an id
    var name = String()
    
    /// Dictionary containing different sized model for different model sizes(enum)
    var modelsOfDifferentSizes = [ModelSize:SCNRefereneNodeExtension]()
}
