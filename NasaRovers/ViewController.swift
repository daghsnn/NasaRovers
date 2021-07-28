//
//  ViewController.swift
//  NasaRovers
//
//  Created by Hasan Dag on 27.07.2021.
//

import UIKit

class CuriosityVC: UIViewController {
    
    
    var nasaTest = NasaServis()
    var viewModel : [Photo]?
    override func viewDidLoad() {
        super.viewDidLoad()
        nasaTest.getCuriosity { (data) in
            self.viewModel = data
//            debugPrint(self.viewModel!)
            debugPrint(self.viewModel?[2].imgSrc)
        }
        
        print(RoverName.curiosity)
    }


}

