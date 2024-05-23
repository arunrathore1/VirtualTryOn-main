//
//  CenteredCollectionViewFlowLayout.swift
//  ARFaceSCNDemo
//
//  Created by pratap singh on 14/08/23.
//

import Foundation
import UIKit

final class CVFlowLayout: UICollectionViewFlowLayout {
  override func prepare() {
    super.prepare()
    scrollDirection = .horizontal
    minimumLineSpacing = 16
    minimumInteritemSpacing = 16
    itemSize = CGSize(width: 62, height: 62)
  }
  
  override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
    guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }
    let parent = super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)

    let itemSpace = itemSize.width + minimumInteritemSpacing
    var currentItemIdx = round(collectionView.contentOffset.x / itemSpace)

    // Skip to the next cell, if there is residual scrolling velocity left.
    // This helps to prevent glitches
    let vX = velocity.x
    if vX > 0 {
      currentItemIdx += 1
    } else if vX < 0 {
      currentItemIdx -= 1
    }

    let nearestPageOffset = currentItemIdx * itemSpace
    return CGPoint(x: nearestPageOffset,
                   y: parent.y)
  }
}
