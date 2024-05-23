//
//  ModelSizeCVCell.swift
//  ARFaceSCNDemo
//
//  Created by Hemant Sudhanshu on 18/07/23.
//

import UIKit
class ModelSizeCVCell: UICollectionViewCell {
  @IBOutlet weak var sizeName: UILabel!
  
  override func layoutSubviews() {
    super.layoutSubviews()
    // Apply circular mask
    self.contentView.layer.cornerRadius = self.contentView.frame.width / 2
    self.contentView.clipsToBounds = true
  }
  
  /** Makes cell larger*/
  func transformToLarge() {
    UIView.animate(withDuration: 0.2) {
    self.transform = CGAffineTransform(scaleX: 1.50, y: 1.50)
    self.layer.borderColor = UIColor.black.cgColor
    self.layer.borderWidth = 1.3
    }
//    let generator = UIImpactFeedbackGenerator(style: .soft)
//    generator.impactOccurred ()
  }
  /** Set cell size to default */
  func transformToStandard () {
    UIView.animate (withDuration: 0.2) {
      self.layer.borderWidth = 0
      self.transform = CGAffineTransform.identity
    }
  }
}

