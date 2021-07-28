//
//  DetailVC.swift
//  NasaRovers
//
//  Created by Hasan Dag on 28.07.2021.
//

import UIKit
import Kingfisher
class DetailVC: UIViewController {
 
    @IBOutlet weak var detailImg: UIImageView!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var roverName: UILabel!
    
    @IBOutlet weak var cameraName: UILabel!
    @IBOutlet weak var missionStatus: UILabel!
    @IBOutlet weak var launchDate: UILabel!
    @IBOutlet weak var landingDate: UILabel!
    var model : Photo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(model: model!)
      
    }
    func configure(model:Photo){
        dateLbl.text = "Photo Date: \(model.earthDate!)"
        roverName.text = "Rover Name: \(model.rover!.name!.rawValue)"
        cameraName.text = "Camera : \(model.camera!.fullName!.rawValue)"
        missionStatus.text = "Mission Status : \(model.rover!.status!.rawValue)"
        launchDate.text = "Launch Date : \(model.rover!.launchDate!)"
        landingDate.text = "Landing Date : \(model.rover!.landingDate!)"
        detailImg.kf.setImage(with: URL(string: model.imgSrc!))
    }
    


}
