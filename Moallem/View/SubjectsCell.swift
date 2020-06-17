//
//  SubjectsCell.swift
//  Moallem
//
//  Created by Mohamed Ibrahem on 6/17/20.
//  Copyright © 2020 Mahmoud Saeed. All rights reserved.
//

import UIKit

class SubjectsCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var conView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    let greenColor = #colorLiteral(red: 0.2001671791, green: 0.6923703551, blue: 0.2402848005, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        conView.layer.cornerRadius = 16
        
        
        conView.layer.shadowColor = greenColor.cgColor
        conView.layer.shadowOpacity = 0.2
        conView.layer.shadowOffset = .zero
        conView.layer.shadowRadius = 8
    }
    
}
