//
//  VideoController.swift
//  Moallem
//
//  Created by Mohamed Ibrahem on 6/17/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import UIKit
import AVKit

class VideoController: UIViewController {
    
    var vidName: String?
    var vidExtension: String?
    
    let videoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        view.addSubview(videoView)
        setupContraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo(videoName: vidName ?? "", videoExtension: vidExtension ?? "")
    }
    
    
    fileprivate func playVideo(videoName: String, videoExtension: String) {
        guard let path = Bundle.main.path(forResource: videoName, ofType: videoExtension) else {return}
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.videoView.bounds
        self.videoView.layer.addSublayer(playerLayer)
        player.play()
    }
    
    fileprivate func setupContraints() {
        NSLayoutConstraint.activate([
            videoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            videoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            videoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            videoView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }

}
