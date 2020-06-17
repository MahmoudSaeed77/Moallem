//
//  ViewController.swift
//  Moallem
//
//  Created by Mohamed Ibrahem on 6/17/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var SubjectsCollectionView: UICollectionView!
    @IBOutlet weak var videosCollectionView: UICollectionView!
    
    let greenColor = #colorLiteral(red: 0.2001671791, green: 0.6923703551, blue: 0.2402848005, alpha: 1)
    
    let imagesArray = ["Physics", "biology", "Group 1", "Algebra"]
    let namesArray = ["Physics", "biology", "History", "Algebra"]
    
    var videos = [VideoModel]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        SubjectsCollectionView.delegate = self
        SubjectsCollectionView.dataSource = self
        
        videosCollectionView.delegate = self
        videosCollectionView.dataSource = self
        
        let firstVideo = VideoModel(videoName: "Instagram", videoExtension: ".mp4")
        videos.append(firstVideo)
        videosCollectionView.reloadData()
        
        let secondVideo = VideoModel(videoName: "YouTube Demo", videoExtension: ".mov")
        videos.append(secondVideo)
        videosCollectionView.reloadData()
        
        let thirdVideo = VideoModel(videoName: "MessengerChatView", videoExtension: ".mov")
        videos.append(thirdVideo)
        videosCollectionView.reloadData()
        
        let fourthVideo = VideoModel(videoName: "SwijCarDemo", videoExtension: ".mov")
        videos.append(fourthVideo)
        videosCollectionView.reloadData()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Moallem"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : greenColor]
        self.navigationController?.navigationBar.tintColor = greenColor
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == videosCollectionView {
            let vc = VideoController()
            vc.vidName = videos[indexPath.item].videoName
            vc.vidExtension = videos[indexPath.item].videoExtension
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == SubjectsCollectionView {
            return imagesArray.count
        }
        
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == SubjectsCollectionView {
            let cell = SubjectsCollectionView.dequeueReusableCell(withReuseIdentifier: "SubjectsCell", for: indexPath) as! SubjectsCell
            cell.imgView.image = UIImage(named: imagesArray[indexPath.item])
            cell.nameLabel.text = namesArray[indexPath.item]
            return cell
        }
        
        let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: "VideosCell", for: indexPath) as! VideosCell
        cell.playVideo(videoName: videos[indexPath.item].videoName ?? "", extensionName: videos[indexPath.item].videoExtension ?? "")
        return cell
    }
    
    
}
