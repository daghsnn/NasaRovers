//
//  OpportunityVC.swift
//  NasaRovers
//
//  Created by Hasan Dag on 27.07.2021.
//

import UIKit
import Kingfisher

class OpportunityVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var service = NasaServis()
    var opportunityModel : [Photo] = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        service.getOpportunity(pagination: false) { (data) in
            self.opportunityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
//        navigationConfig()

        service.getOpportunity(pagination: false) { (data) in
            self.opportunityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
 
    // MARK: UICollectionViewDataSource

   


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return opportunityModel.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RoverCell
        let indexCell = opportunityModel[indexPath.row]
        let url = URL(string: indexCell.imgSrc!)
        let urlCached = ImageResource(downloadURL: url!, cacheKey: indexCell.imgSrc!)

        cell.opportunityImg.kf.setImage(with: urlCached)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "opportunityToDetail", sender: opportunityModel[indexPath.row])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "opportunityToDetail" {
            let vc = segue.destination as! DetailVC
            vc.model = sender as! Photo
        }
    }
    // MARK: Layout Flow delegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        let noOfCellsInRow = 3

           let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

           let totalSpace = flowLayout.sectionInset.left
               + flowLayout.sectionInset.right
               + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

           let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

           return CGSize(width: size, height: size)
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (collectionView.contentSize.height - 100 - scrollView.frame.size.height) {
            DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
                self.service.getOpportunity(pagination: true) { (data) in
                    self.opportunityModel.append(contentsOf: data)
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                            
                        }
                    }
            }
                    

        }

    }
    
    // MARK: Navigation Functions

    @IBAction func allBtn(_ sender: Any) {
        service.getOpportunity(pagination: false) { (data) in
            self.opportunityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }

        }
    }
    @IBAction func fhazBtn(_ sender: Any) {
        service.getOpportunityCam(camera: camera.fhaz.rawValue, pagination: true) { (data) in
            self.opportunityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            
            
            }
        }
    }
    @IBAction func rhazBtn(_ sender: Any) {
        service.getOpportunityCam(camera: camera.rhaz.rawValue, pagination: true) { (data) in
            self.opportunityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }

    }
    @IBAction func mastBtn(_ sender: Any) {
        service.getOpportunityCam(camera: camera.mast.rawValue, pagination: true) { (data) in
            self.opportunityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }
    @IBAction func chemcamBtn(_ sender: Any) {
        service.getOpportunityCam(camera: camera.chemcam.rawValue, pagination: true) { (data) in
            self.opportunityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }
    @IBAction func mahliBtn(_ sender: Any) {
        service.getOpportunityCam(camera: camera.mahli.rawValue, pagination: true) { (data) in
            self.opportunityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }
    @IBAction func navcamBtn(_ sender: Any) {
        service.getOpportunityCam(camera: camera.navcam.rawValue, pagination: true) { (data) in
            self.opportunityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }
    @IBAction func pancamBtn(_ sender: Any) {
        service.getOpportunityCam(camera: camera.pancam.rawValue, pagination: true) { (data) in
            self.opportunityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }


}
