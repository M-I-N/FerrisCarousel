//
//  VideoPlayerViewController.swift
//  VideoPlayer
//
//  Created by Nayem on 1/14/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit
import AVKit

class VideoPlayerViewController: AVPlayerViewController {
    
    var video: Video?
    var allowAutoPlay = true
    
    private let imageView = UIImageView()
    private var playbackModeObservationToken: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // add the image view to the content overlay view so that image will be shown below the player controls
//        contentOverlayView?.addSubview(imageView)
        // safely unwrap video object, download thumbnail image & creaate player item
        if let video = video {
            imageView.downloaded(from: video.thumbnailImageURL, contentMode: .scaleAspectFill)
            
            let asset = AVAsset(url: video.sourceURL)
            let item = AVPlayerItem(asset: asset)
            player = AVPlayer(playerItem: item)
//            player?.isMuted = true
            
            // add AVPlayer observer to control image view show/hide
            playbackModeObservationToken = player?.observe(\.timeControlStatus) { [unowned self] (player, _) in
                switch player.timeControlStatus {
                case .paused:
                    self.imageView.isHidden = false
                case .playing:
                    self.imageView.isHidden = true
                case .waitingToPlayAtSpecifiedRate:
                    self.imageView.isHidden = false
                }
            }
            
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // essential for the image view to have its framing
        imageView.frame = contentOverlayView?.bounds ?? .zero
    }

}
