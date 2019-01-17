//
//  FSPagerView+Extension.swift
//  FerrisCarousel
//
//  Created by Nayem BJIT on 1/17/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit

extension FSPagerView {
    var centerMostCompletelyVisibleCell: FSPagerViewCell? {
        let cell = cellForItem(at: centermostIndexPath.item)
        return cell
    }
}
