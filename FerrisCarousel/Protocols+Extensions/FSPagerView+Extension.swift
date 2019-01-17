//
//  FSPagerView+Extension.swift
//  FerrisCarousel
//
//  Created by Nayem BJIT on 1/17/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit

extension FSPagerView {
    func rectForCell(at index: Int) -> CGRect {
        guard let cell = self.cellForItem(at: index) else {
            return .zero
        }
        // need actual calculation
//        let attributes = self.collectionView.layoutAttributesForItem(at: <#T##IndexPath#>)
        return .zero
    }
}
