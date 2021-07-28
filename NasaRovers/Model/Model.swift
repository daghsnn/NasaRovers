//
//  Model.swift
//  NasaRovers
//
//  Created by Hasan Dag on 27.07.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct MarsRovers: Codable {
    let photos: [Photo]?
}

// MARK: - Photo
struct Photo: Codable {
    let id, sol: Int?
    let camera: Camera?
    let imgSrc: String?
    let earthDate: String?
    let rover: Rover?

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

// MARK: - Camera
struct Camera: Codable {
    let id: Int?
    let name: CameraName?
    let roverID: Int?
    let fullName: FullName?

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}


enum FullName: String, Codable {
    case frontHazardAvoidanceCamera = "Front Hazard Avoidance Camera"
    case rearHazardAvoidanceCamera = "Rear Hazard Avoidance Camera"
    case mastCamera = "Mast Camera"
    case chemistryAndCameraComplex = "Chemistry and Camera Complex"
    case marsHandLensImager = "Mars Hand Lens Imager"
    case marsDescentImager = "Mars Descent Imager"
    case navigationCamera = "Navigation Camera"
    case panoramicCamera = "Panoramic Camera"
    case miniatureThermalEmissionSpectrometer  = "Miniature Thermal Emission Spectrometer (Mini-TES)"
}

enum CameraName: String, Codable {
    case fhaz = "FHAZ"
    case rhaz = "RHAZ"
    case mast = "MAST"
    case chemcam = "CHEMCAM"
    case mahli = "MAHLI"
    case mardi = "MARDI"
    case navcam = "NAVCAM"
    case pancam = "PANCAM"
    case minites = "MINITES"
}

// MARK: - Rover
struct Rover: Codable {
    let id: Int?
    let name: RoverName?
    let landingDate, launchDate: String?
    let status: Status?

    enum CodingKeys: String, CodingKey {
        case id, name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
    }
}


enum RoverName: String, Codable {
    case curiosity = "Curiosity"
    case opportunity = "Opportunity"
    case spirit = "Spirit"

}
enum Status:String, Codable{
    
    case active = "active"
    case complete = "complete"
    }

