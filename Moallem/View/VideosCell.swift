//
//  VideosCell.swift
//  Moallem
//
//  Created by Mohamed Ibrahem on 6/17/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import UIKit
import AVKit

class VideosCell: UICollectionViewCell {
    
    @IBOutlet weak var vidView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vidView.backgroundColor = UIColor.darkGray
        vidView.layer.cornerRadius = 20
        vidView.clipsToBounds = true
    }
    
    func playVideo(videoName: String, extensionName: String) {
        guard let path = Bundle.main.path(forResource: videoName, ofType: extensionName) else {return}
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: self.vidView.frame.width, height: self.vidView.frame.height)
        self.vidView.layer.addSublayer(playerLayer)
    }
}
