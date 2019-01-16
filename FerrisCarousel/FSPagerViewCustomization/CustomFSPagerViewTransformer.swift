//
//  CustomFSPagerViewTransformer.swift
//  FerrisCarousel
//
//  Created by Nayem BJIT on 1/16/19.
//  Copyright © 2019 BJIT Ltd. All rights reserved.
//

import UIKit

final class CustomFSPagerViewTransformer: FSPagerViewTransformer {
    
    override func applyTransform(to attributes: FSPagerViewLayoutAttributes) {
        guard let pagerView = self.pagerView else {
            return
        }
        switch self.type {
        case .invertedFerrisWheelWithScaling:
            guard pagerView.scrollDirection == .horizontal else {
                // This type doesn't support vertical mode
                return
            }
            // http://ronnqvi.st/translate-rotate-translate/
            var zIndex = 0
            let position = attributes.position
            let scale = max(1 - (1-self.minimumScale) * abs(position), self.minimumScale)
            var transform = CGAffineTransform(scaleX: scale, y: scale)
            switch position {
            case -5 ... 5:
                let itemSpacing = attributes.bounds.width+self.proposedInteritemSpacing()
                let count: CGFloat = 14
                let circle: CGFloat = .pi * 2.0
                let radius = itemSpacing * count / circle
                let ty = radius * -1
                let theta = circle / count
                let rotation = position * theta * -1
                transform = transform.translatedBy(x: -position*itemSpacing, y: ty)
                transform = transform.rotated(by: rotation)
                transform = transform.translatedBy(x: 0, y: -ty)
                zIndex = Int((4.0-abs(position)*10))
            default:
                break
            }
            attributes.alpha = abs(position) < 0.5 ? 1 : self.minimumAlpha
            attributes.transform = transform
            attributes.zIndex = zIndex
        default:
            super.applyTransform(to: attributes)
        }
    }
}
