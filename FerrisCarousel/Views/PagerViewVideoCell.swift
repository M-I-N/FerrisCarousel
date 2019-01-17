//
//  PagerViewVideoCell.swift
//  FerrisCarousel
//
//  Created by Nayem on 1/16/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit
import AVKit

class PagerViewVideoCell: FSPagerViewCell {
    
    var video: Video? {
        didSet {
            if let video = video {
                thumbnailImageView.downloaded(from: video.thumbnailImageURL, contentMode: .scaleToFill)
                videoPlayerViewController.video = video
            }
        }
    }
    
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    
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
    
    private lazy var videoPlayerViewController = {
        return VideoPlayerViewController()
    }()
    
    func addViewController(to parentViewController: UIViewController) {
        parentViewController.addChild(videoPlayerViewController)
        videoPlayerViewController.didMove(toParent: parentViewController)
        videoPlayerViewController.view.frame = contentView.bounds
        contentView.addSubview(videoPlayerViewController.view)
    }
    
    func removeViewControllerFromParentController() {
        videoPlayerViewController.view.removeFromSuperview()
        videoPlayerViewController.willMove(toParent: nil)
        videoPlayerViewController.removeFromParent()
    }
    
    func playVideo() {
        print("\(video!.thumbnailImageURL.lastPathComponent) is playing")
        videoPlayerViewController.player?.play()
    }
    
    func pauseVideo() {
        print("\(video!.thumbnailImageURL.lastPathComponent) is paused")
        videoPlayerViewController.player?.pause()
    }

}
