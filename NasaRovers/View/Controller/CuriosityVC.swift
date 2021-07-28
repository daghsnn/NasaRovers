//
//  CuriosityVC.swift
//  NasaRovers
//
//  Created by Hasan Dag on 27.07.2021.
//

import UIKit
import Kingfisher

class CuriosityVC: UICollectionViewController {
    
    var service = NasaServis()

    lazy var viewModel : RoversViewModel = {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        return RoversViewModel()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCuriosity(paginate: false)
        print(viewModel)
      
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return viewModel.numberOfCells
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RoverCell
        
        let url = URL(string: viewModel.roverCellViewModel[indexPath.row].imageURL)
        cell.curiosityImg.kf.setImage(with: url)
        return cell
    }
    func configureCollection(){
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {

            let rowNumber : CGFloat = 3
            let spacing : CGFloat = 4


            let totalSpace = spacing * (rowNumber - 1)
            let itemSpace = totalSpace / rowNumber
            let cellWidth = collectionView.frame.width / rowNumber - itemSpace
            let cellHeight = cellWidth
            layout.itemSize = CGSize(width: cellWidth, height: cellHeight)

            layout.minimumInteritemSpacing = spacing

            layout.minimumLineSpacing = spacing

        }

    }
    
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let position = scrollView.contentOffset.y
//        if position > (collectionView.contentSize.height - 100 - scrollView.frame.size.height) {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                self.service.getCuriosity(pagination: true) { (data) in
//                    self.viewModel.fillModel(photos: data)
//                    DispatchQueue.main.async {
//                        self.collectionView.reloadData()
//                    }
//                }
//            }
//
//
//        }
//
//    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
// MARK:Extension

extension CuriosityVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3, height: view.frame.width/5)
    }
}
