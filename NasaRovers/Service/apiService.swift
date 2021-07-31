//
//  apiService.swift
//  NasaRovers
//
//  Created by Hasan Dag on 27.07.2021.
//

import Foundation
import Alamofire

protocol NasaProtocols {
    func getCuriosity(pagination: Bool, complete: @escaping ([Photo])->() )
    func getCuriostyCam(camera:camera.RawValue,pagination: Bool, complete: @escaping ([Photo])->() )

    func getOpportunity(pagination: Bool, complete: @escaping ([Photo])->() )
    func getOpportunityCam(camera:camera.RawValue,pagination: Bool, complete: @escaping ([Photo])->() )

    func getSpirit(pagination: Bool, complete: @escaping ([Photo])->() )
    func getSpiritCam(camera:camera.RawValue,pagination: Bool, complete: @escaping ([Photo])->() )
    
}
enum api : String {
    case apiKey = "8cYhjzHY2fRjbaoeKT1XeWFeC9oTxsuOeMmeekld"
    case apiKeyParametere = "&api_key=8cYhjzHY2fRjbaoeKT1XeWFeC9oTxsuOeMmeekld"
    case baseUrl = "https://api.nasa.gov/mars-photos/api/v1/rovers/"
}
enum rover: String {
    case curiosity = "curiosity"
    case opportunity = "opportunity"
    case spirit = "spirit"

}
enum camera: String {
    case All  
    case fhaz = "fhaz"
    case rhaz = "rhaz"
    case mast = "mast"
    case chemcam = "chemcam"
    case mahli = "mahli"
    case mardi = "mardi"
    case navcam = "navcam"
    case pancam = "pancam"
    case minites = "minites"
}
enum querys : String {
    case photo = "photos"
}
class NasaServis : NasaProtocols  {
    
    
    
   
   
    
    
   
    
    
    
    public var sol = Int()
    private static var page = 1
    
    func getCuriosity(pagination : Bool ,complete: @escaping ([Photo]) -> ()) {
        
        if pagination == false {
            sol = 1000
        }
        else {
            sol = sol - 1
        }
        let params: [String: String] = ["sol": String(sol), "page": String(NasaServis.page), "api_key": api.apiKey.rawValue]

        AF.request("\(api.baseUrl.rawValue)\(rover.curiosity)/photos?",method: .get, parameters: params).validate().responseDecodable(of: MarsRovers.self) { (data) in
            guard let photos =  data.value else {return}
            complete(photos.photos!)
        }
       
    }
    func getCuriostyCam(camera: camera.RawValue, pagination: Bool, complete: @escaping ([Photo]) -> ()) {
        if pagination == false {
            sol = 1000
        }
        else {
            sol = sol - 1
        }
        let params: [String: String] = ["sol": String(sol), "page": String(NasaServis.page), "api_key": api.apiKey.rawValue,  "camera" : camera ]

        AF.request("\(api.baseUrl.rawValue)\(rover.curiosity)/photos?",method: .get, parameters: params).validate().responseDecodable(of: MarsRovers.self) { (data) in
            guard let photos =  data.value else {return}
            complete(photos.photos!)
        }
    }
    func getOpportunity(pagination: Bool, complete: @escaping ([Photo]) -> ()) {
        if pagination == false {
            sol = 1000
        }
        else {
            sol = sol - 1
        }
        let params: [String: String] = ["sol": String(sol), "page": String(NasaServis.page), "api_key": api.apiKey.rawValue]

        AF.request("\(api.baseUrl.rawValue)\(rover.opportunity)/photos?",method: .get, parameters: params).validate().responseDecodable(of: MarsRovers.self) { (data) in
            guard let photos =  data.value else {return}
            complete(photos.photos!)
        }
        
    }
    func getOpportunityCam(camera: camera.RawValue, pagination: Bool, complete: @escaping ([Photo]) -> ()) {
        if pagination == false {
            sol = 1000
        }
        else {
            sol = sol - 1
        }
        let params: [String: String] = ["sol": String(sol), "page": String(NasaServis.page), "api_key": api.apiKey.rawValue,  "camera" : camera ]

        AF.request("\(api.baseUrl.rawValue)\(rover.opportunity)/photos?",method: .get, parameters: params).validate().responseDecodable(of: MarsRovers.self) { (data) in
            guard let photos =  data.value else {return}
            complete(photos.photos!)
        }
    }
    
    func getSpirit(pagination: Bool, complete: @escaping ([Photo]) -> ()) {
        if pagination == false {
            sol = 1000
        }
        else {
            sol = sol - 1
        }
        let params: [String: String] = ["sol": String(sol), "page": String(NasaServis.page), "api_key": api.apiKey.rawValue]

        AF.request("\(api.baseUrl.rawValue)\(rover.spirit)/photos?", parameters: params).validate().responseDecodable(of: MarsRovers.self) { (data) in
            guard let photos =  data.value else {return}
            print("parametrelerle çalıştı")
            complete(photos.photos!)
        }
    }
    func getSpiritCam(camera: camera.RawValue, pagination: Bool, complete: @escaping ([Photo]) -> ()) {
        if pagination == false {
            sol = 1000
        }
        else {
            sol = sol - 1
        }
        let params: [String: String] = ["sol": String(sol), "page": String(NasaServis.page), "api_key": api.apiKey.rawValue,  "camera" : camera ]

        AF.request("\(api.baseUrl.rawValue)\(rover.spirit)/photos?",method: .get, parameters: params).validate().responseDecodable(of: MarsRovers.self) { (data) in
            guard let photos =  data.value else {return}
            complete(photos.photos!)
        }
    }
    
    
    
    
}
