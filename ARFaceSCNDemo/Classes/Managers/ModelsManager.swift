//
//  ModelsManager.swift
//  ARFaceSCNDemo
//
//  Created by Hemant Sudhanshu on 18/07/23.
//

import ARKit

/// Provides 3D models to display, to the ViewControllers
class ModelsManager{
    //MARK: Properties
    private static var instance : ModelsManager?
    
    //MARK: Initialisation
    private init() {
    }
    
    /// Used for singleton implementation
    ///
    /// - Returns: Single instance of this class
    static func getInstance() -> ModelsManager {
        //If instance is not created, create a new one and return it after assigning to "instance" varible
        guard let _ = instance else {
            instance = ModelsManager()
            return instance!
        }
        return instance!
    }
    
    /// Returns an array of Appearences for a given model
    /// - Parameter modelName: Name of model for which appearences are required. All of it is static, dummy data.
    private func getAppearences(forModel modelName: String) -> [Appearence]{
        //Array to be filled and returned
        var appearences = [Appearence]()
        
        //Add appearences to the array for the corresponding model
        switch modelName {
        //Spectacles
        case Constants.ModelNames.object3d:
          var matFrame = SCNMaterial()
          var matLens = SCNMaterial()
          var matStick = SCNMaterial()
          let stickBlackframeBlue = Appearence(materials: [matFrame, matLens, matStick, matStick, matLens], displayColor: UIColor(red: 33, green: 33, blue: 33))
          
          matFrame.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
          matLens.diffuse.contents = UIColor(red: 33, green: 33, blue: 33)
          matStick.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
          appearences.append(stickBlackframeBlue)
          
          matFrame = SCNMaterial()
          matLens = SCNMaterial()
          matStick = SCNMaterial()
          
          let stickGreenFrameBlack = Appearence(materials: [matFrame, matLens, matStick, matStick, matLens], displayColor: UIColor(red: 0, green: 84, blue: 147))
          
          matFrame.diffuse.contents = UIColor(red: 0, green:84, blue: 147)
          matLens.diffuse.contents = UIColor(red: 33, green: 33, blue: 33)
          matStick.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
          appearences.append(stickGreenFrameBlack)
        case Constants.ModelNames.aviators:
            var matFrame = SCNMaterial()
            var matLens = SCNMaterial()
            var matStick = SCNMaterial()
            let stickBlackframeBlue = Appearence(materials: [matFrame, matLens, matStick, matStick, matLens], displayColor: UIColor(red: 33, green: 33, blue: 33))
            
            matFrame.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
            matLens.diffuse.contents = UIColor(red: 33, green: 33, blue: 33)
            matStick.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
            appearences.append(stickBlackframeBlue)
            
            matFrame = SCNMaterial()
            matLens = SCNMaterial()
            matStick = SCNMaterial()
            
            let stickGreenFrameBlack = Appearence(materials: [matFrame, matLens, matStick, matStick, matLens], displayColor: UIColor(red: 0, green: 84, blue: 147))
            
            matFrame.diffuse.contents = UIColor(red: 0, green:84, blue: 147)
            matLens.diffuse.contents = UIColor(red: 33, green: 33, blue: 33)
            matStick.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
            appearences.append(stickGreenFrameBlack)
            
        case Constants.ModelNames.aviators2:
            
            var matFrame = SCNMaterial()
            var matLens = SCNMaterial()
            var matStickEnd = SCNMaterial()
            var matStickStart = SCNMaterial()
            let stickBlackFrameGreen = Appearence(materials: [matStickStart, matStickEnd, matFrame, matLens, matLens,matLens,matLens,matLens], displayColor: UIColor(red: 5, green: 240, blue: 5))
            
            matFrame.diffuse.contents = UIColor(red: 142, green: 250, blue: 0)
            matLens.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
            matStickEnd.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
            matStickStart.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
            
            appearences.append(stickBlackFrameGreen)
            
            matFrame = SCNMaterial()
            matLens = SCNMaterial()
            matStickEnd = SCNMaterial()
            matStickStart = SCNMaterial()
            
            matFrame.diffuse.contents = UIColor(red: 255, green: 251, blue: 0)
            matLens.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
            matStickEnd.diffuse.contents = UIColor(red: 0, green: 253, blue: 255)
            matStickStart.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
            
            let stickTealFrameYellow = Appearence(materials: [matStickStart, matStickEnd, matFrame, matLens, matLens,matLens,matLens,matLens], displayColor: UIColor(red: 255, green: 252, blue: 65))
            appearences.append(stickTealFrameYellow)
            
            matFrame = SCNMaterial()
            matLens = SCNMaterial()
            matStickEnd = SCNMaterial()
            matStickStart = SCNMaterial()
            
            matFrame.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
            matLens.diffuse.contents = UIColor(red: 107, green: 168, blue: 203)
            matLens.diffuse.intensity = 1.5
            matStickEnd.diffuse.contents = UIColor(red: 107, green: 168, blue: 203)
            matStickEnd.diffuse.intensity = 1.5
            matStickStart.diffuse.contents = UIColor(red: 149, green: 148, blue: 155)
            
            let stickGreyBlueLens = Appearence(materials: [matStickStart, matStickEnd, matFrame, matLens, matLens,matLens,matLens,matLens], displayColor: UIColor(red: 107, green: 168, blue: 203))
            appearences.append(stickGreyBlueLens)
            
        case Constants.ModelNames.simpleSquare:
            let matBlack = SCNMaterial()
            let matDarkGrey = SCNMaterial()
            let blackStickDarkGreyFrame = Appearence(materials: [matBlack,matBlack,matBlack,matBlack,matBlack,matDarkGrey], displayColor: UIColor(red: 66, green: 66, blue: 66))
            
            matBlack.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
            matDarkGrey.diffuse.contents = UIColor(red: 66, green: 66, blue: 66)
            appearences.append(blackStickDarkGreyFrame)
            
        case Constants.ModelNames.squareSunGlasses:
            let matBlack = SCNMaterial()
            let matDarkGrey = SCNMaterial()
            let blackFrameGreyLens = Appearence(materials: [matBlack,matDarkGrey], displayColor: UIColor(red: 0, green: 0, blue: 0))
            
            matBlack.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
            matDarkGrey.diffuse.contents = UIColor(red: 94, green: 94, blue: 94)
            
            appearences.append(blackFrameGreyLens)
            
        case Constants.ModelNames.nosePinFlat:
            let matGold = SCNMaterial()
            let golden = Appearence(materials: [matGold], displayColor: UIColor(red: 255, green: 212, blue: 121))
            
            matGold.diffuse.contents = UIColor(red: 255, green: 212, blue: 121)
            matGold.diffuse.intensity = 1
            
            appearences.append(golden)
            
        case Constants.ModelNames.earRing:
            let transparent = SCNMaterial()
            let silver = SCNMaterial()
            let teal = SCNMaterial()
            
            transparent.diffuse.contents = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            silver.diffuse.contents = UIColor(red: 235, green: 235, blue: 235)
            silver.diffuse.intensity = 2
            teal.diffuse.contents = UIColor(red: 115, green: 253, blue: 255)
            
            let silverTeal = Appearence(materials: [transparent,transparent,transparent,transparent,transparent,silver, teal, silver, silver, silver], displayColor: UIColor(red: 235, green: 235, blue: 235))
            appearences.append(silverTeal)
            
        case Constants.ModelNames.headband:
            let matSilver = SCNMaterial()
            let silver = Appearence(materials: [matSilver], displayColor: UIColor(red: 214, green: 214, blue: 214))
            
            matSilver.diffuse.contents = UIColor(red: 214, green: 214, blue: 214)
            matSilver.diffuse.intensity = 1.7
            appearences.append(silver)
            
        case Constants.ModelNames.nosePin:
            let matGold = SCNMaterial()
            let matSilver = SCNMaterial()
            let goldenSilver = Appearence(materials: [matGold, matSilver], displayColor: UIColor(red: 255, green: 212, blue: 121))
            
            matGold.diffuse.contents = UIColor(red: 255, green: 212, blue: 121)
            matGold.diffuse.intensity = 2
            matSilver.diffuse.contents = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
            matSilver.diffuse.intensity = 2.5
            appearences.append(goldenSilver)
            
        case Constants.ModelNames.noseRing:
            let matGold = SCNMaterial()
            let golden = Appearence(materials: [matGold], displayColor: UIColor(red: 255, green: 212, blue: 121))
            matGold.diffuse.contents = UIColor(red: 249, green: 225, blue: 55)
            matGold.diffuse.intensity = 1
            appearences.append(golden)
            
        case Constants.ModelNames.earRingPearl:
            let matPin = SCNMaterial()
            let matHead = SCNMaterial()
            
            let golden = Appearence(materials: [matPin, matHead], displayColor: UIColor(red: 255, green: 212, blue: 121))
            matPin.diffuse.contents = UIColor(red: 214, green: 214, blue: 214)
            matPin.diffuse.intensity = 1
            matHead.diffuse.contents = UIColor(red: 255, green: 252, blue: 121)
            matHead.diffuse.intensity = 1
            appearences.append(golden)
            
        case Constants.ModelNames.bunnyHairBand:
            let matOrange = SCNMaterial()
            
            let orange = Appearence(materials: [matOrange], displayColor: UIColor(red: 255, green: 147, blue: 0))
            matOrange.diffuse.contents = UIColor(red: 255, green: 147, blue: 0)
            appearences.append(orange)
            
        case Constants.ModelNames.headband:
            let matSilver = SCNMaterial()
            
            let silver = Appearence(materials: [matSilver], displayColor: UIColor(red: 214, green: 214, blue: 214))
            matSilver.diffuse.contents = UIColor(red: 241, green: 214, blue: 214)
            
            appearences.append(silver)
        case Constants.ModelNames.tiara:
            let matSilver = SCNMaterial()
            let matDarkGrey = SCNMaterial()
            
            let silver = Appearence(materials: [matSilver, matDarkGrey], displayColor: UIColor(red: 146, green: 146, blue: 146))
            matSilver.diffuse.contents = UIColor(red: 235, green: 235, blue: 235)
            matDarkGrey.diffuse.contents = UIColor(red: 146, green: 146, blue: 146)
            
            appearences.append(silver)
            
        default:
          var matFrame = SCNMaterial()
          var matLens = SCNMaterial()
          var matStick = SCNMaterial()
          let stickBlackframeBlue = Appearence(materials: [matFrame, matLens, matStick, matStick, matLens], displayColor: UIColor(red: 33, green: 33, blue: 33))
          
          matFrame.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
          matLens.diffuse.contents = UIColor(red: 33, green: 33, blue: 33)
          matStick.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
          appearences.append(stickBlackframeBlue)
          
          matFrame = SCNMaterial()
          matLens = SCNMaterial()
          matStick = SCNMaterial()
          
          let stickGreenFrameBlack = Appearence(materials: [matFrame, matLens, matStick, matStick, matLens], displayColor: UIColor(red: 0, green: 84, blue: 147))
          
          matFrame.diffuse.contents = UIColor(red: 0, green:84, blue: 147)
          matLens.diffuse.contents = UIColor(red: 33, green: 33, blue: 33)
          matStick.diffuse.contents = UIColor(red: 0, green: 0, blue: 0)
          appearences.append(stickGreenFrameBlack)
        }
        return appearences
    }
    
    
    /// Returns a model with the given name. Appearence and Size info included
    /// - Parameter name: Name of the required model
    func getModel(withName name: String) -> Model3D{
        let model = getModelWithoutAppearence(withName: name)
        
        //Add appearence to model without appearence
        for modelOfASpecificSize in model.modelsOfDifferentSizes{
            //Get the appearence for this model
            let appearences = getAppearences(forModel: name)
            //Attach the fetched appearence to the model
            for apprncs in appearences{
                modelOfASpecificSize.value.availableAppearences.append(apprncs)
            }
        }
        return model
    }
    
    /// Returns model with a give name. Size info included. Appearence info not included
    /// - Parameter withName: Name of the required model
    private func getModelWithoutAppearence(withName: String) -> Model3D{
      let glass1 = SCNRefereneNodeExtension(named: Constants.ModelNames.glass1)
      glass1.scale = SCNVector3(0.0014, 0.0014, 0.0014)
      glass1.position.z = 0.063
      glass1.position.x = 0.00
      glass1.position.y = 0.02
      glass1.id = Constants.ModelIds.aviators
      glass1.tag = Constants.ModelTags.specs
      let glass2 = SCNRefereneNodeExtension(named: Constants.ModelNames.glass2)
      glass2.scale = SCNVector3(0.0014, 0.0014, 0.0014)
      glass2.position.z = 0.063
      glass2.position.x = 0.00
      glass2.position.y = 0.02
      glass2.id = Constants.ModelIds.aviators
      glass2.tag = Constants.ModelTags.specs
      let glass3 = SCNRefereneNodeExtension(named: Constants.ModelNames.glass3)
      glass3.scale = SCNVector3(0.0014, 0.0014, 0.0014)
      glass3.position.z = 0.063
      glass3.position.x = 0.00
      glass3.position.y = 0.02
      glass3.id = Constants.ModelIds.aviators
      glass3.tag = Constants.ModelTags.specs
      let glass4 = SCNRefereneNodeExtension(named: Constants.ModelNames.glass4)
      glass4.scale = SCNVector3(0.0014, 0.0014, 0.0014)
      glass4.position.z = 0.063
      glass4.position.x = 0.00
      glass4.position.y = 0.02
      glass4.id = Constants.ModelIds.aviators
      glass4.tag = Constants.ModelTags.specs
      let glass5 = SCNRefereneNodeExtension(named: Constants.ModelNames.glass5)
      glass5.scale = SCNVector3(0.0014, 0.0014, 0.0014)
      glass5.position.z = 0.063
      glass5.position.x = 0.00
      glass5.position.y = 0.02
      glass5.id = Constants.ModelIds.aviators
      glass5.tag = Constants.ModelTags.specs
        switch withName {
        case Constants.ModelNames.object3d:
          let aviators_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.object3d)
          aviators_SMALL.scale = SCNVector3(0.0014, 0.0014, 0.0014)
          aviators_SMALL.position.z = 0.063
          aviators_SMALL.position.x = 0.00
          aviators_SMALL.position.y = 0.02
          aviators_SMALL.id = Constants.ModelIds.aviators
          aviators_SMALL.tag = Constants.ModelTags.specs
          var aviators = Model3D()
          aviators.modelsOfDifferentSizes[ModelSize.XS] = aviators_SMALL
          return aviators
        case Constants.ModelNames.glass1:
          var aviators = Model3D()
          aviators.modelsOfDifferentSizes[ModelSize.XS] = glass1
          aviators.modelsOfDifferentSizes[ModelSize.L] = glass2
          aviators.modelsOfDifferentSizes[ModelSize.M] = glass3
          aviators.modelsOfDifferentSizes[ModelSize.S] = glass4
          aviators.modelsOfDifferentSizes[ModelSize.XXL] = glass5
          return aviators
        case Constants.ModelNames.glass2:
          var aviators = Model3D()
          aviators.modelsOfDifferentSizes[ModelSize.XS] = glass1
          aviators.modelsOfDifferentSizes[ModelSize.L] = glass2
          aviators.modelsOfDifferentSizes[ModelSize.M] = glass3
          aviators.modelsOfDifferentSizes[ModelSize.S] = glass4
          aviators.modelsOfDifferentSizes[ModelSize.XXL] = glass5
          return aviators
        case Constants.ModelNames.glass3:
          var aviators = Model3D()
          aviators.modelsOfDifferentSizes[ModelSize.XS] = glass1
          aviators.modelsOfDifferentSizes[ModelSize.L] = glass2
          aviators.modelsOfDifferentSizes[ModelSize.M] = glass3
          aviators.modelsOfDifferentSizes[ModelSize.S] = glass4
          aviators.modelsOfDifferentSizes[ModelSize.XXL] = glass5
          return aviators
        case Constants.ModelNames.glass4:
          var aviators = Model3D()
          aviators.modelsOfDifferentSizes[ModelSize.XS] = glass1
          aviators.modelsOfDifferentSizes[ModelSize.L] = glass2
          aviators.modelsOfDifferentSizes[ModelSize.M] = glass3
          aviators.modelsOfDifferentSizes[ModelSize.S] = glass4
          aviators.modelsOfDifferentSizes[ModelSize.XXL] = glass5
          return aviators
        case Constants.ModelNames.glass5:
          var aviators = Model3D()
          aviators.modelsOfDifferentSizes[ModelSize.XS] = glass1
          aviators.modelsOfDifferentSizes[ModelSize.L] = glass2
          aviators.modelsOfDifferentSizes[ModelSize.M] = glass3
          aviators.modelsOfDifferentSizes[ModelSize.S] = glass4
          aviators.modelsOfDifferentSizes[ModelSize.XXL] = glass5
          return aviators
        case Constants.ModelNames.aviators:
            let aviators_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.aviators)
            aviators_SMALL.scale = SCNVector3(0.00012, 0.0001, 0.0001)
            aviators_SMALL.position.z = 0.04
            aviators_SMALL.position.x = 0.024
            aviators_SMALL.id = Constants.ModelIds.aviators
            aviators_SMALL.tag = Constants.ModelTags.specs
            
            let aviators_EXTRA_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.aviators)
            aviators_EXTRA_SMALL.scale = SCNVector3(0.00011, 0.0001, 0.0001)
            aviators_EXTRA_SMALL.position.z = 0.04
            aviators_EXTRA_SMALL.position.x = 0.024
            aviators_EXTRA_SMALL.id = Constants.ModelIds.aviators
            aviators_EXTRA_SMALL.tag = Constants.ModelTags.specs
            
            var aviators = Model3D()
            aviators.modelsOfDifferentSizes[ModelSize.XS] = aviators_EXTRA_SMALL
            aviators.modelsOfDifferentSizes[ModelSize.S] = aviators_SMALL
            
            return aviators
        case Constants.ModelNames.aviators2:
            let aviators2_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.aviators2)
            aviators2_SMALL.scale = SCNVector3(0.0014, 0.00125, 0.0013)
            aviators2_SMALL.position.z = 0.06
            aviators2_SMALL.position.y = 0.02
            aviators2_SMALL.id = Constants.ModelIds.aviators2
            aviators2_SMALL.tag = Constants.ModelTags.specs
            
            var aviators2 = Model3D()
            aviators2.modelsOfDifferentSizes[ModelSize.S] = aviators2_SMALL
            
            return aviators2
        case Constants.ModelNames.squareSunGlasses:
            let sqrSG_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.squareSunGlasses)
            sqrSG_SMALL.scale = SCNVector3(0.004, 0.0039, 0.003)
            sqrSG_SMALL.position.z = 0.06
            sqrSG_SMALL.position.x = 0
            sqrSG_SMALL.position.y = 0.0025
            sqrSG_SMALL.id = Constants.ModelIds.sqrSG
            sqrSG_SMALL.tag = Constants.ModelTags.specs
            
            var sqrSunglasses = Model3D()
            sqrSunglasses.modelsOfDifferentSizes[ModelSize.S] = sqrSG_SMALL
            
            return sqrSunglasses
        case Constants.ModelNames.simpleSquare:
            let simpleSqr = SCNRefereneNodeExtension(named: Constants.ModelNames.simpleSquare)
//            simpleSqr.scale = SCNVector3(0.004, 0.0039, 0.003)
            simpleSqr.scale = SCNVector3(2, 2, 2)

//            simpleSqr.position.z = 0.06
//            simpleSqr.position.x = 0
//            simpleSqr.position.y = 0.0025
            
                simpleSqr.position.z = -5
                simpleSqr.position.x = 0
                simpleSqr.position.y = 0
    
            simpleSqr.id = Constants.ModelIds.simpleSquare
            simpleSqr.tag = Constants.ModelTags.specs
            
            var sqrSunglasses = Model3D()
            sqrSunglasses.modelsOfDifferentSizes[ModelSize.S] = simpleSqr
            
            return sqrSunglasses
        case Constants.ModelNames.noseRing:
            let noseRing_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.noseRing)
            noseRing_SMALL.position = SCNVector3(0.015 - 0.033, 0.01 + (-0.045), 0.065)
            noseRing_SMALL.scale = SCNVector3(0.0015, 0.0015, 0.0015)
            noseRing_SMALL.id = Constants.ModelIds.noseRing
            noseRing_SMALL.tag = Constants.ModelTags.accessories
            
            var noseRings = Model3D()
            noseRings.modelsOfDifferentSizes[ModelSize.S] = noseRing_SMALL
            
            return noseRings
//        case Constants.ModelNames.noseRing2:
//            let noseRing2_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.noseRing2)
//            noseRing2_SMALL.position = SCNVector3(0.015 - 0.033 - 0.005, -0.0035 , 0.04)
//            noseRing2_SMALL.scale = SCNVector3(0.0008, 0.0008, 0.0008)
//            noseRing2_SMALL.id = "noseRing2_SMALL"
//            noseRing2_SMALL.tag = Constants.ModelTags.accessories
//
//            var noseRings1 = Model3D()
//            noseRings1.modelsOfDifferentSizes[ModelSize.S] = noseRing2_SMALL
//
//            return noseRings1
        case Constants.ModelNames.nosePin:
            let nosePin_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.nosePin)
            nosePin_SMALL.position = SCNVector3(0.015 - 0.029 + 0.0062, -0.01 , 0.05)
            nosePin_SMALL.scale = SCNVector3(0.005, 0.005, 0.005)
            nosePin_SMALL.tag = Constants.ModelTags.accessories
            nosePin_SMALL.id = Constants.ModelIds.nosePin
            
            var nosePins = Model3D()
            nosePins.modelsOfDifferentSizes[ModelSize.S] = nosePin_SMALL
            
            return nosePins
        case Constants.ModelNames.tiara:
            let tiara_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.tiara)
            tiara_SMALL.scale = SCNVector3(0.03, 0.03, 0.05)
            tiara_SMALL.position = SCNVector3(0,0.08,-0.1)
            tiara_SMALL.id = Constants.ModelIds.tiara
            tiara_SMALL.tag = Constants.ModelTags.accessories
            
            var tiaras = Model3D()
            tiaras.modelsOfDifferentSizes[ModelSize.S] = tiara_SMALL
            
            return tiaras
        case Constants.ModelNames.earRing:
            let earRing_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.earRing)
            
            let earRingRight = SCNReferenceNode(named: Constants.ModelNames.earRing)
            earRingRight.scale = SCNVector3(0.045, 0.045, 0.045)
            earRingRight.position = SCNVector3(0.075,-0.16,-0.08)
            earRing_SMALL.addChildNode(earRingRight)
            
            let earRingLeft = SCNReferenceNode(named: Constants.ModelNames.earRing)
            
            earRingLeft.rotation = SCNVector4(0,1,0, GLKMathDegreesToRadians(180.0))
            earRingLeft.scale = SCNVector3(0.045, 0.045, 0.045)
            earRingLeft.position = SCNVector3(-0.075,-0.16,-0.08)
            
            earRing_SMALL.addChildNode(earRingLeft)
            earRing_SMALL.id = Constants.ModelIds.earRing
            earRing_SMALL.tag = Constants.ModelTags.accessories
            
            var earRings = Model3D()
            earRings.modelsOfDifferentSizes[ModelSize.S] = earRing_SMALL
            
            return earRings
        case Constants.ModelNames.earRingPearl:
            let earRing_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.earRingPearl)
            earRing_SMALL.scale = SCNVector3(0.002, 0.002, 0.0005)
            earRing_SMALL.position = SCNVector3(-0.011000001,-0.0050000004,0.0599)
            earRing_SMALL.id = Constants.ModelIds.earRingPearl
            earRing_SMALL.tag = Constants.ModelTags.accessories
            
            var earRings = Model3D()
            earRings.modelsOfDifferentSizes[ModelSize.S] = earRing_SMALL
            
            return earRings
        case Constants.ModelNames.headband:
            let headBand_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.headband)
            headBand_SMALL.scale = SCNVector3(0.002, 0.002, 0.0005)
            headBand_SMALL.position = SCNVector3(0,0,0.0599)
            headBand_SMALL.id = Constants.ModelIds.headband
            headBand_SMALL.tag = Constants.ModelTags.accessories
            
            var headbands = Model3D()
            headbands.modelsOfDifferentSizes[ModelSize.S] = headBand_SMALL
            
            return headbands
            
        case Constants.ModelNames.bunnyHairBand:
            let headBand_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.bunnyHairBand)
            headBand_SMALL.scale = SCNVector3(0.002, 0.002, 0.0005)
            headBand_SMALL.position = SCNVector3(0,0,0.0599)
            headBand_SMALL.id = Constants.ModelIds.bunnyHairBand
            headBand_SMALL.tag = Constants.ModelTags.accessories
            
            var headbands = Model3D()
            headbands.modelsOfDifferentSizes[ModelSize.S] = headBand_SMALL
            
            return headbands
        case Constants.ModelNames.headband:
            let headBand_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.headband)
            headBand_SMALL.scale = SCNVector3(0.002, 0.002, 0.0005)
            headBand_SMALL.position = SCNVector3(0,0,0.0599)
            headBand_SMALL.id = Constants.ModelIds.headband
            headBand_SMALL.tag = Constants.ModelTags.accessories
            
            var headbands = Model3D()
            headbands.modelsOfDifferentSizes[ModelSize.S] = headBand_SMALL
            
            return headbands
        case Constants.ModelNames.nosePinFlat:
            let headBand_SMALL = SCNRefereneNodeExtension(named: Constants.ModelNames.nosePinFlat)
            headBand_SMALL.scale = SCNVector3(0.000500001, 0.000500001, 0.0005000001)
            headBand_SMALL.position = SCNVector3(-0.021,-0.0010000002,0.043900058)
            headBand_SMALL.id = Constants.ModelIds.nosePinFlat
            headBand_SMALL.tag = Constants.ModelTags.accessories
            
            var headbands = Model3D()
            headbands.modelsOfDifferentSizes[ModelSize.S] = headBand_SMALL
            
            return headbands
        default:
            return Model3D()
        }
      
    }
    
    /// Provides 3D model data for MakeUp accessories
    ///
    /// - Returns: Array of 3D Models
    func getMakeupData() -> [SCNRefereneNodeExtension]{
        var data = [SCNRefereneNodeExtension]()
        
        let lipstickGeometry = ARSCNFaceGeometry(device: MTLCreateSystemDefaultDevice()!)!
        let lipstickmaterial = lipstickGeometry.firstMaterial!
        lipstickmaterial.diffuse.contents = UIImage(named: Constants.ImageAssetsName.upperLip)
        lipstickmaterial.lightingModel = .physicallyBased
        let lipstickNode = SCNRefereneNodeExtension()
        lipstickNode.geometry = lipstickGeometry
        lipstickNode.tag = Constants.ModelTags.specs
        data.append(lipstickNode)
        
        let tattoGeometry = ARSCNFaceGeometry(device: MTLCreateSystemDefaultDevice()!)!
        let tattoMaterial = tattoGeometry.firstMaterial!
        tattoMaterial.diffuse.contents = UIImage(named: Constants.ImageAssetsName.lowerLip)
        tattoMaterial.lightingModel = .physicallyBased
        let tattoNode = SCNRefereneNodeExtension()
        tattoNode.geometry = tattoGeometry
        tattoNode.tag = Constants.ModelTags.specs
        data.append(tattoNode)
        
        return data
    }
}

