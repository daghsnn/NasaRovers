//
//  RoversViewModel.swift
//  NasaRovers
//
//  Created by Hasan Dag on 27.07.2021.
//

import Foundation


class RoversViewModel {
    let apiService: NasaProtocols
    var photoList : [Photo] = [Photo]()
    var roverCellViewModel : [RoverCellViewModel] = [RoverCellViewModel]()
    var numberOfCells: Int {
        return roverCellViewModel.count
    }
    
    init( apiService: NasaProtocols = NasaServis()) {
        self.apiService = apiService
    }
    func fetchCuriosity(paginate:Bool) {
        apiService.getCuriosity(pagination: paginate) { (data) in
            self.fillModel(photos: data)
        }
    }

    func createCellViewModel( results: Photo ) -> RoverCellViewModel {
      
        return RoverCellViewModel(imageURL: results.imgSrc!, launchDate: results.rover!.launchDate!, landingDate: results.rover!.landingDate!, photoDate: results.earthDate!, missionStatus: results.rover!.status!, roverName: results.rover!.name!, cameraName: results.camera!.fullName!, cameraShort: results.camera!.name!)
    }
    func getCellViewModel( at indexPath: IndexPath ) -> RoverCellViewModel {
        return roverCellViewModel[indexPath.row]
    }
    func fillModel (photos : [Photo] ){
        self.photoList = photos
        var photoModelCell = [RoverCellViewModel]()
        for photo in photos {
            photoModelCell.append(createCellViewModel(results: photo))
        }
        self.roverCellViewModel = photoModelCell
    }
}



struct RoverCellViewModel {
    let imageURL, launchDate, landingDate, photoDate : String
    let missionStatus : Status
    let roverName : RoverName
    let cameraName : FullName
    let cameraShort : CameraName
}
