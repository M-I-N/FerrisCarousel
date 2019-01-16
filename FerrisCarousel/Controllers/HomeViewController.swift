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
//            pagerView.isInfinite = true

            pagerView.dataSource = self
            pagerView.delegate = self
        }
    }

    private var token: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        token = pagerView.observe(\.currentIndex) { (pagerView, _) in
//            print(pagerView.currentIndex)
//        }
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
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        guard let pagerViewVideoCell = cell as? PagerViewVideoCell else { return }
        pagerViewVideoCell.addViewController(to: self)
    }
    func pagerView(_ pagerView: FSPagerView, didEndDisplaying cell: FSPagerViewCell, forItemAt index: Int) {
        guard let pagerViewVideoCell = cell as? PagerViewVideoCell else { return }
        pagerViewVideoCell.removeViewControllerFromParentController()
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        guard let pagerViewCurrentVideoCell = pagerView.cellForItem(at: pagerView.currentIndex) as? PagerViewVideoCell, let pagerViewTargetVideoCell = pagerView.cellForItem(at: targetIndex) as? PagerViewVideoCell else { return }
        pagerViewCurrentVideoCell.pauseVideo()
        pagerViewTargetVideoCell.playVideo()
    }
}
