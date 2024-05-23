//
//  TryModelVC.swift
//  ARFaceSCNDemo
//
//  Created by Hemant Sudhanshu on 18/07/23.
//

import UIKit
import ARKit
import SceneKit.ModelIO

class TryModelVC: UIViewController {
  
  //MARK:- Outlets
  @IBOutlet var sceneView: ARSCNView!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  //Show the available sizes for this model
  @IBOutlet weak var modelSizesCV: UICollectionView!
  
  @IBOutlet weak var faceWidthLbl: UILabel!
  
  var centerCell: ModelSizeCVCell?
  var parentNode: SCNNode?
  var occlusionNode: SCNNode!
  //Contains models of all sizes
  var faceOverlayContent: Model3D?
  //Contains model of a specific size
  var faceOverlayModel: SCNRefereneNodeExtension?
  var availableSizesOfModel : [ModelSize]?
  var selectedSizeOfModel : ModelSize?
  var hasARStarted = false
  var nameOfModelToDisplay: String!
  //Offsets for position and scale tuning of the 3D Model
  var positionChangeOffset = 0.001
  var scaleChangeOffset = 0.1
  let referenceInterEyeDistance: Float = 500.0
  let modelsData:[String] = [
    Constants.ModelNames.glass1,
    Constants.ModelNames.glass2,
    Constants.ModelNames.glass3,
    Constants.ModelNames.glass4,
    Constants.ModelNames.glass5,
  ]
  private let collectionViewFlowLayout = CVFlowLayout()
  //MARK:- Life-cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
    modelSizesCV.collectionViewLayout = collectionViewFlowLayout
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    // AR experiences typically involve moving the device without
    // touch input for some time, so prevent auto screen dimming.
    UIApplication.shared.isIdleTimerDisabled = true
    // "Reset" to run the AR session for the first time.
    let layoutMargins = modelSizesCV.layoutMargins.left + modelSizesCV.layoutMargins.right
    let sideInsets = (self.view.frame.width / 2) - layoutMargins
    self.modelSizesCV.contentInset = UIEdgeInsets(top: 0, left: sideInsets, bottom: 0, right: sideInsets)
    let index = modelsData.firstIndex(of: nameOfModelToDisplay) ?? 0
    modelSizesCV.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
    resetTracking()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    sceneView.session.pause()
  }
  
  func initialSetup() {
    sceneView.delegate = self
    sceneView.session.delegate = self
    sceneView.automaticallyUpdatesLighting = true
    
    availableSizesOfModel = [ModelSize]()
    faceOverlayContent = ModelsManager.getInstance().getModel(withName: nameOfModelToDisplay)
    for model in faceOverlayContent!.modelsOfDifferentSizes{
      if selectedSizeOfModel == nil{
        selectedSizeOfModel = model.key
      }
      availableSizesOfModel?.append(model.key)
    }
    
    //We make a clone because we don't want the original model's size and scale to change when we change it in this scene
    //We break the reference by making a clone of the original model
    faceOverlayModel = faceOverlayContent?.modelsOfDifferentSizes[selectedSizeOfModel!]?.clone()
    faceOverlayModel?.id = faceOverlayContent?.modelsOfDifferentSizes[selectedSizeOfModel!]?.id
    faceOverlayModel?.childNodes.first?.geometry?.materials = (faceOverlayContent?.modelsOfDifferentSizes[selectedSizeOfModel!]?.availableAppearences[0].materials)!
    activityIndicator.startAnimating()
    
  }
  
  // MARK: - Error handling
  func displayErrorMessage(title: String, message: String) {
    // Present an alert informing about the error that has occurred.
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let restartAction = UIAlertAction(title: "Restart Session", style: .default) { _ in
      alertController.dismiss(animated: true, completion: nil)
      self.resetTracking()
    }
    
    alertController.addAction(restartAction)
    present(alertController, animated: true, completion: nil)
  }
  
  func resetTracking() {
    guard ARFaceTrackingConfiguration.isSupported else { return }
    let configuration = ARFaceTrackingConfiguration()
    configuration.isLightEstimationEnabled = true
    sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
  }
}

//MARK: ARSessionDelegate Delegates
extension TryModelVC: ARSessionDelegate{
  func session(_ session: ARSession, didFailWithError error: Error) {
    guard error is ARError else { return }
    
    let errorWithInfo = error as NSError
    let messages = [
      errorWithInfo.localizedDescription,
      errorWithInfo.localizedFailureReason,
      errorWithInfo.localizedRecoverySuggestion
    ]
    
    let errorMessage = messages.compactMap({ $0 }).joined(separator: "\n")
    DispatchQueue.main.async {
      self.displayErrorMessage(title: "The AR session failed.", message: errorMessage)
    }
  }
  
  func session(_ session: ARSession, didUpdate frame: ARFrame) {
    hasARStarted = true
    activityIndicator.stopAnimating()
  }
}

//MARK:- ARSCNViewDelegate
extension TryModelVC: ARSCNViewDelegate{

  func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
    guard let _ = renderer as? ARSCNView,
          anchor is ARFaceAnchor, let device = sceneView.device else { return nil }
    //
    //    /*
    //     Write depth but not color and render before other objects.
    //     This causes the geometry to occlude other SceneKit content
    //     while showing the camera view beneath, creating the illusion
    //     that real-world objects are obscuring virtual 3D objects.
    //     */
    let faceGeometry = ARSCNFaceGeometry(device: device)!
    faceGeometry.firstMaterial!.colorBufferWriteMask = []
    
    occlusionNode = SCNNode(geometry: faceGeometry)
    occlusionNode.renderingOrder = -1
    parentNode = SCNNode()
    parentNode!.addChildNode(occlusionNode)
    parentNode?.addChildNode(faceOverlayModel!)
    faceOverlayModel?.physicsBody?.categoryBitMask = 1 // Assign a unique bit mask
    faceOverlayModel?.physicsBody?.contactTestBitMask = 2 // Bit mask of objects to test for contact
    faceOverlayModel?.physicsBody?.collisionBitMask = 0
    return parentNode
  }
  
  func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
    guard
      let faceAnchor = anchor as? ARFaceAnchor,
      let faceGeometry = occlusionNode.geometry as? ARSCNFaceGeometry
    else {
      print("error")
      return }
    
    let leftFaceVertex = faceAnchor.geometry.vertices[474]
    let rightFaceVertex = faceAnchor.geometry.vertices[890]
    let leftFaceScnVector = convertToSCNVector3(simdVector: leftFaceVertex)
    let rightFaceScnVector = convertToSCNVector3(simdVector: rightFaceVertex)
    let checkDistance = calculate3DDistance(leftFaceScnVector, rightFaceScnVector)
    DispatchQueue.main.async {
      self.faceWidthLbl.text = "\(checkDistance * 1000) mm"
    }
    var glassesSize: SCNVector3 = SCNVector3()
    if let glassesBoundingBox = faceOverlayModel?.boundingBox {
      glassesSize = SCNVector3(
        x: glassesBoundingBox.max.x - glassesBoundingBox.min.x,
        y: glassesBoundingBox.max.y - glassesBoundingBox.min.y,
        z: glassesBoundingBox.max.z - glassesBoundingBox.min.z
      )
    } else {
      print("Unable to get the glasses model's bounding box.")
    }
    let glassWidth = glassesSize.x
    var scaleFactor: Float = (checkDistance / glassWidth)
    if(scaleFactor < 0.0012) {
      scaleFactor = 0.00012
    }
    // Update the glassesNode's scale
    faceOverlayModel?.scale = SCNVector3(scaleFactor + (scaleFactor / 5.5), scaleFactor, scaleFactor)
    let position = (faceAnchor.leftEyeTransform.columns.3 + faceAnchor.rightEyeTransform.columns.3) / 2
    faceOverlayModel?.position = SCNVector3(position.x, position.y , position.z + 0.028)
    faceGeometry.update(from: faceAnchor.geometry)
  }
  
  func convertToSCNVector3(simdVector: SIMD3<Float>) -> SCNVector3 {
    return SCNVector3(simdVector.x, simdVector.y, simdVector.z)
  }
  
  func calculate3DDistance(_ point1: SCNVector3, _ point2: SCNVector3) -> Float {
    let deltaX = point2.x - point1.x
    let deltaY = point2.y - point1.y
    let deltaZ = point2.z - point1.z
    
    return sqrt(deltaX * deltaX + deltaY * deltaY + deltaZ * deltaZ)
  }
  
  func calculateEyeDistance(from faceAnchor: ARFaceAnchor) -> Float {
    // Get the positions of the two landmarks that represent the width of the face.
    let leftEyePosition = faceAnchor.leftEyeTransform.columns.3
    let rightEyePosition = faceAnchor.rightEyeTransform.columns.3
    
    let xDiff = rightEyePosition.x - leftEyePosition.x
    let yDiff = rightEyePosition.y - leftEyePosition.y
    let zDiff = rightEyePosition.z - leftEyePosition.z
    let distance = sqrt(xDiff * xDiff + yDiff * yDiff + zDiff * zDiff)
    return distance
  }
}

extension TryModelVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return availableSizesOfModel?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellName = self.modelSizesCV.dequeueReusableCell(withReuseIdentifier: Constants.CellNames.modelSizeCVCell, for: indexPath) as! ModelSizeCVCell
    cellName.layer.cornerRadius = cellName.frame.height / 2
    cellName.sizeName.text = modelsData[indexPath.row]
    cellName.backgroundColor = UIColor.white
    return cellName
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    selectedSizeOfModel = availableSizesOfModel?[indexPath.row]
    faceOverlayModel?.removeFromParentNode()
    faceOverlayModel = faceOverlayContent?.modelsOfDifferentSizes[selectedSizeOfModel!]?.clone()
    parentNode!.addChildNode(faceOverlayModel!)
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    guard scrollView is UICollectionView else { return }
    let centerPoint = CGPoint(x: self.modelSizesCV.frame.size.width / 2 + scrollView.contentOffset.x, y: self.modelSizesCV.frame.size.height / 2 + scrollView.contentOffset.y)
    if let indexPath = self.modelSizesCV.indexPathForItem(at: centerPoint) {
      self.centerCell = (self.modelSizesCV.cellForItem(at: indexPath) as! ModelSizeCVCell)
      self.centerCell?.transformToLarge()
      selectedSizeOfModel = availableSizesOfModel?[indexPath.row]
      faceOverlayModel?.removeFromParentNode()
      faceOverlayModel = faceOverlayContent?.modelsOfDifferentSizes[selectedSizeOfModel!]?.clone()
      if let parentNode = parentNode {
        parentNode.addChildNode(faceOverlayModel!)
      }
    }
    if let cell = self.centerCell {
      let offsetX = centerPoint.x - cell.center.x
      if offsetX < -15 || offsetX > 15 {
        cell.transformToStandard()
        faceOverlayModel?.removeFromParentNode()
        self.centerCell = nil
      }
    }
  }
}

public extension SCNVector3 {
  static func - (lhs: SCNVector3, rhs: SCNVector3) -> SCNVector3 {
      return SCNVector3(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
  }
  static func * (vector: SCNVector3, scalar: Float) -> SCNVector3 {
      return SCNVector3(vector.x * scalar, vector.y * scalar, vector.z * scalar)
  }
}
