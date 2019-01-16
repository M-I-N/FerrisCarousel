//
//  PagerViewVideoCell.swift
//  FerrisCarousel
//
//  Created by Nayem BJIT on 1/16/19.
//  Copyright © 2019 BJIT Ltd. All rights reserved.
//

import UIKit

class PagerViewVideoCell: FSPagerViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    internal static func dequeue(fromPagerView pagerView: FSPagerView, atIndex index: Int) -> PagerViewVideoCell {
        guard let cell: PagerViewVideoCell = pagerView.dequeueReusableCell(at: index) else {
            fatalError("*** Failed to dequeue CollectionViewCell ***")
        }
        return cell
    }

}