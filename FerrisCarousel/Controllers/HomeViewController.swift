//
//  HomeViewController.swift
//  FerrisCarousel
//
//  Created by Nayem on 1/16/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private let videos = Video.allVideos()

    @IBOutlet private weak var pagerView: FSPagerView! {
        didSet {
            pagerView.transformer = CustomFSPagerViewTransformer(type: .invertedFerrisWheelWithScaling)
            pagerView.registerReusableCell(PagerViewVideoCell.self)
//            pagerView.itemSize = CGSize(width: 180, height: 140)
            let transform = CGAffineTransform(scaleX: 0.5, y: 1.0)
            pagerView.itemSize = pagerView.frame.size.applying(transform)
            pagerView.decelerationDistance = FSPagerView.automaticDistance
            pagerView.isInfinite = true

            pagerView.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension HomeViewController: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return videos.count
    }

    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = PagerViewVideoCell.dequeue(fromPagerView: pagerView, atIndex: index)
        let video = videos[index]
        cell.video = video
        return cell
    }
}

extension HomeViewController: FSPagerViewDelegate {
    func pagerView(_ pagerView: FSPagerView, didEndDisplaying cell: FSPagerViewCell, forItemAt index: Int) {
//        let cellRect = pagerView.rectForCell(at: index)
    }
}
