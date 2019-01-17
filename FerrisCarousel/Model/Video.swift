//
//  Video.swift
//  SwipeablePlayerView
//
//  Created by Nayem on 1/8/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import Foundation

struct Video: Equatable {
    
    let sourceURL: URL
    let thumbnailImageURL: URL
    
    static func allVideos() -> [Video] {
        
        // use local video files. but keep in mind to add those resrouces
//        let videoURLs = [ Bundle.main.url(forResource: "BigBuckBunny", withExtension: ".mp4"),
//                          Bundle.main.url(forResource: "ElephantsDream", withExtension: ".mp4"),
//                          Bundle.main.url(forResource: "Sintel", withExtension: ".mp4"),
//                          Bundle.main.url(forResource: "TearsOfSteel", withExtension: ".mp4")
//                        ].compactMap { $0 }
        
        let videoURLs = [ URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
                          URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"),
                          URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4"),
                          URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4")
            ].compactMap { $0 }
        
        let videoThumbnailImages = [ URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg"),
                                     URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg"),
                                     URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/Sintel.jpg"),
                                     URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/TearsOfSteel.jpg")
                                    ].compactMap { $0 }
        
        let videos = zip(videoURLs, videoThumbnailImages).map { Video(sourceURL: $0.0, thumbnailImageURL: $0.1) }
        
        return videos
    }
    
}
