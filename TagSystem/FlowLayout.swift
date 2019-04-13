//
//  FlowLayout.swift
//  TagSystem
//
//  Created by Igor Marcos on 13/04/19.
//  Copyright © 2019 Igor Marcos. All rights reserved.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesForElementsInRect = super.layoutAttributesForElements(in: rect)
        var newAttributesForElementsInRect = [UICollectionViewLayoutAttributes]()
        var leftMargin: CGFloat = 0.0
        for attributes in attributesForElementsInRect! {
            var refAttributes = attributes as! UICollectionViewLayoutAttributes
            
            // assign value if next row
            if (refAttributes.frame.origin.x == self.sectionInset.left) {
                leftMargin = self.sectionInset.left
            } else {
                // set x position of attributes to current margin
                var newLeftAlignedFrame = refAttributes.frame
                newLeftAlignedFrame.origin.x = leftMargin
                refAttributes.frame = newLeftAlignedFrame
            }
            // calculate new value for current margin
            leftMargin += refAttributes.frame.size.width + 8
            newAttributesForElementsInRect.append(refAttributes)
        }
        return newAttributesForElementsInRect
    }


}
