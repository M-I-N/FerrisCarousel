//
//  FSPagerView+Reusable.swift
//  FerrisCarousel
//
//  Created by Nayem BJIT on 1/16/19.
//  Copyright © 2019 BJIT Ltd. All rights reserved.
//

import UIKit

extension FSPagerView {

    /// Registers a UICollectionViewCell subclass for reuse, by
    /// registering a UINib or Type for the object's reuseIdentifier.
    ///
    /// - Parameter _: UICollectionViewCell to register for reuse.
    func registerReusableCell<T: FSPagerViewCell>(_: T.Type) {
        if let nib = T.nib {
            self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
        }
    }

    /// Dequeues a UICollectionViewCell for reuse given a specific indexPath.
    ///
    /// - Parameter indexPath: indexPath to dequeue cell for
    /// - Returns: a reused UICollectionViewCell associated with the indexPath
    func dequeueReusableCell<T: FSPagerViewCell>(at index: Int) -> T? {
        return self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, at: index) as? T
    }

}
