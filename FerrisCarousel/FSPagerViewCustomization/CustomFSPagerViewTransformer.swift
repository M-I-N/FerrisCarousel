//
//  CustomFSPagerViewTransformer.swift
//  FerrisCarousel
//
//  Created by Nayem on 1/16/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit

final class CustomFSPagerViewTransformer: FSPagerViewTransformer {
    
    override func applyTransform(to attributes: FSPagerViewLayoutAttributes) {
        guard let pagerView = pagerView else {
            return
        }
        switch type {
        case .invertedFerrisWheelWithScaling:
            guard pagerView.scrollDirection == .horizontal else {
                // This type doesn't support vertical mode
                return
            }
            // http://ronnqvi.st/translate-rotate-translate/
            var zIndex = 0
            let position = attributes.position
            let scale = max(1 - (1 - minimumScale) * abs(position), minimumScale)
            var transform = CGAffineTransform(scaleX: scale, y: scale)
            switch position {
            case -5 ... 5:
                let itemSpacing = attributes.bounds.width + proposedInteritemSpacing()
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
            attributes.alpha = abs(position) < 0.5 ? 1 : minimumAlpha
            attributes.transform = transform
            attributes.zIndex = zIndex
        default:
            super.applyTransform(to: attributes)
        }
    }

    override func proposedInteritemSpacing() -> CGFloat {
        // if you need to control item spacing, return a value from here
        // super class will return default value (0, because super class doesn't handle .invertedFerrisWheelWithScaling type)
        return super.proposedInteritemSpacing()
    }
}
