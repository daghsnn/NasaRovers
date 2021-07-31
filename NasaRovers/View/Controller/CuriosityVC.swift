//
//  CuriosityVC.swift
//  NasaRovers
//
//  Created by Hasan Dag on 27.07.2021.
//

import UIKit
import Kingfisher

class CuriosityVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    
//
    
    var service = NasaServis()
    var curiosityModel : [Photo] = [Photo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        service.getCuriosity(pagination: false) { (data) in
            self.curiosityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
//        navigationConfig()

        service.getCuriosity(pagination: false) { (data) in
            self.curiosityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
 
    // MARK: UICollectionViewDataSource

   


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return curiosityModel.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RoverCell
        let indexCell = curiosityModel[indexPath.row]
        let url = URL(string: indexCell.imgSrc!)
        let urlCached = ImageResource(downloadURL: url!, cacheKey: indexCell.imgSrc!)

        cell.curiosityImg.kf.setImage(with: urlCached)
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "opportunityToDetail", sender: curiosityModel[indexPath.row])
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
                self.service.getCuriosity(pagination: true) { (data) in
                    self.curiosityModel.append(contentsOf: data)
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                            
                        }
                    }
            }
                    

        }

    }
    
    // MARK: Navigation Functions

    @IBAction func allBtn(_ sender: Any) {
        service.getCuriosity(pagination: true) { (data) in
            self.curiosityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }

        }
    }
    @IBAction func fhazBtn(_ sender: Any) {
        service.getCuriostyCam(camera: camera.fhaz.rawValue, pagination: true) { (data) in
            self.curiosityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            
            
            }
        }
    }
    @IBAction func rhazBtn(_ sender: Any) {
        service.getCuriostyCam(camera: camera.rhaz.rawValue, pagination: true) { (data) in
            self.curiosityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }

    }
    @IBAction func mastBtn(_ sender: Any) {
        service.getCuriostyCam(camera: camera.mast.rawValue, pagination: true) { (data) in
            self.curiosityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }
    @IBAction func chemcamBtn(_ sender: Any) {
        service.getCuriostyCam(camera: camera.chemcam.rawValue, pagination: true) { (data) in
            self.curiosityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }
    @IBAction func mahliBtn(_ sender: Any) {
        service.getCuriostyCam(camera: camera.mahli.rawValue, pagination: true) { (data) in
            self.curiosityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }
    @IBAction func navcamBtn(_ sender: Any) {
        service.getCuriostyCam(camera: camera.navcam.rawValue, pagination: true) { (data) in
            self.curiosityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }
    @IBAction func pancamBtn(_ sender: Any) {
        service.getCuriostyCam(camera: camera.pancam.rawValue, pagination: true) { (data) in
            self.curiosityModel = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
           
        }
    }
    // MARK: Navigation Functions

    
}
// MARK:Extension Picker View
//func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return pagination.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return pagination[row]
//    }
//
//    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
//        pickerView.isHidden = false
//        return false
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        cameraText.inputView = pickerView
//
//        cameraText.text = pagination[row]
//        self.dismiss(animated: true) {
//            if let selectedCam = self.cameraText.text {
//                self.cameraType = camera(rawValue: selectedCam)!
//                print(self.cameraType)
//
//            }
//        }
//        pickerView.isHidden = true
//        self.service.getCuriostyCam(camera: cameraType.rawValue, pagination: true) { (data) in
//            self.curiosityModel = data
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
//        cameraText.resignFirstResponder()
//    }

