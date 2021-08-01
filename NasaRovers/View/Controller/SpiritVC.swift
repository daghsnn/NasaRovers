//
//  SpiritVC.swift
//  NasaRovers
//
//  Created by Hasan Dag on 27.07.2021.
//

import UIKit
import Kingfisher

protocol PaginationProtocol {
    var delegate: String {get set}
    func whoClicked(camera:String) -> String
}

class SpiritVC: UICollectionViewController,  UICollectionViewDelegateFlowLayout, PaginationProtocol{
    var delegate: String = ""
    
    func whoClicked(camera: String) -> String {
        delegate = camera
        return delegate
    }
    

    var service = NasaServis()
    var spiritModel : [Photo] = [Photo]()
    var pagdelegate : PaginationProtocol!
    var beginPaginate = false

    override func viewDidLoad() {
        super.viewDidLoad()

        service.getSpirit(pagination: false) { (data) in
            self.spiritModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
//        navigationConfig()

        service.getSpirit(pagination: false) { (data) in
            self.spiritModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    // MARK: UICollectionViewDataSource
   

   

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return spiritModel.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RoverCell
        let indexCell = spiritModel[indexPath.row]
        let url = URL(string: indexCell.imgSrc!)
        let urlCached = ImageResource(downloadURL: url!, cacheKey: indexCell.imgSrc!)

        cell.spiritImg.kf.setImage(with: urlCached)
    
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "spiritToDetail", sender: spiritModel[indexPath.row])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "spiritToDetail" {
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
    
   
   // MARK: Scroll
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (collectionView.contentSize.height - 100 - scrollView.frame.size.height) {
            if !beginPaginate {
                beginPagination()
                DispatchQueue.global().asyncAfter(deadline: .now() + 1.0, execute: {
                    self.service.getCuriosity(pagination: true) { (data) in
                        self.spiritModel.append(contentsOf: data)
                        self.beginPaginate = false
                        self.collectionView.reloadData()
                        }
                })
                    
                        
                }
            

                    

        }

    }
    func beginPagination() {
        beginPaginate = true
    }
    
    // MARK: Navigation Functions
    @IBAction func allBtn(_ sender: Any) {
        service.getSpirit(pagination: true) { (data) in
            self.spiritModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        self.whoClicked(camera: "All")
    }
    @IBAction func fhazBtn(_ sender: Any) {
        service.getSpiritCam(camera: camera.fhaz.rawValue, pagination: true) { (data) in
            self.spiritModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            
            
            }
            
        }
//        self.whoClicked(camera: camera.fhaz.rawValue)
    }
    @IBAction func rhazBtn(_ sender: Any) {
        service.getSpiritCam(camera: camera.rhaz.rawValue, pagination: true) { (data) in
            self.spiritModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
       
    }
    @IBAction func mastBtn(_ sender: Any) {
        service.getSpiritCam(camera: camera.mast.rawValue, pagination: true) { (data) in
            self.spiritModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }
    @IBAction func chemcamBtn(_ sender: Any) {
        service.getSpiritCam(camera: camera.chemcam.rawValue, pagination: true) { (data) in
            self.spiritModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }

    }
    @IBAction func mahliBtn(_ sender: Any) {
        service.getSpiritCam(camera: camera.mahli.rawValue, pagination: true) { (data) in
            self.spiritModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
       

    }
    @IBAction func navcamBtn(_ sender: Any) {
        service.getSpiritCam(camera: camera.navcam.rawValue, pagination: true) { (data) in
            self.spiritModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
       
    }
    @IBAction func pancamBtn(_ sender: Any) {
        service.getSpiritCam(camera: camera.pancam.rawValue, pagination: true) { (data) in
            self.spiritModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
        

    }
}
//MARK:Pagination delegate deneme
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let position = scrollView.contentOffset.y
//        if position > (collectionView.contentSize.height - 100 - scrollView.frame.size.height) {
//            switch delegate{
//            case "All" : DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//
//                self.service.getSpirit(pagination: true) { (data) in
//                    self.spiritModel.append(contentsOf: data)
//                        DispatchQueue.main.async {
//                            self.collectionView.reloadData()
//
//                        }
//                }
//            }
//            default:
//                print("default")
//
//            }
//            if delegate == "All" {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//
//                    self.service.getSpirit(pagination: true) { (data) in
//                        self.spiritModel.append(contentsOf: data)
//                            DispatchQueue.main.async {
//                                self.collectionView.reloadData()
//
//                            }
//                    }
//
//
//                }
//            }else{
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//
//                    self.service.getSpiritCam(camera:self.delegate,pagination: true) { (data) in
//                        self.spiritModel.append(contentsOf: data)
//                            DispatchQueue.main.async {
//                                self.collectionView.reloadData()
//
//                            }
//                    }
//            }
//
//
//
//        }
//
//    }
