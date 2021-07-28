//
//  RoverCell.swift
//  NasaRovers
//
//  Created by Hasan Dag on 27.07.2021.
//

import UIKit
import Kingfisher
class RoverCell: UICollectionViewCell {
    
    @IBOutlet weak var curiosityImg: UIImageView!
    @IBOutlet weak var opportinityLabel: UILabel!

    func configImage(imgURL : URL) {
        curiosityImg.kf.setImage(with: imgURL)
    }
    
}
