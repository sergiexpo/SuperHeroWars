//
//  ApiService.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 10/3/21.
//

import Foundation
import Alamofire

let apiToken = "10224756221601581"
let baseURL = {
    String.init(format: "https://superheroapi.com/api/%@",
                arguments: [apiToken])
}()

//En %@, que corresponde al character-id, ponemos el id de un personaje, por ejemplo 324
let apiCharacterIdUrl = "/%@" 
let apiPowerStatsUrl = "/%@/powerstats"
let apiBiographyUrl = "/%@/biography"
let apiBAppearanceUrl = "/%@/appearance"
let apiWorkUrl = "/%@/work"
let apiConnectionsUrl = "/%@/connections"
let apiImagesUrl = "/%@/image"
let apiSearchUrl = "/%@/name"   //En name poner el nombre de un personaje




enum ServiceResult{
    case success(data: Any?)
    case failure(error: String?)
}

typealias ServiceCompletion = (_ result: ServiceResult) -> ()





class ApiService{
    static let shared = {
        ApiService()
    }()
    
    private init() {}
    
    
    //MARK: - Services -
    
    //El escaping quiere decir que el closure se "escapa" de la función, es decir, que aunque termine la función el closure seguirá vivo. Si no pusieramos escaping, el closure moriría con la función.
    
    func fetchHero(by id: String, completion: @escaping ServiceCompletion){
        let urlCharacterId = String.init(format: apiCharacterIdUrl,
                                         arguments: [id])
        
        AF.request("\(baseURL)\(urlCharacterId)",       //Dirección a la que vamos a llamar
                   method: .get,                        // El método nos lo dicen
                   encoding: URLEncoding.default).responseDecodable{
                    (response: DataResponse<CharacterDTO, AFError>) in
                    // print(response.value.debugDescription)
                    if let error = response.error{
                        completion(.failure(error: error.localizedDescription))
                    } else {
                        
                        completion(.success(data: response.value))
                    }
                   }
    }
    
    //********** CORE DATA ***************** //
    
/*
    
    func fetchHeroDB(by id: String, completion: @escaping ServiceCompletion){
        let urlCharacterId = String.init(format: apiCharacterIdUrl,
                                         arguments: [id])
        
        AF.request("\(baseURL)\(urlCharacterId)",       
                   method: .get,
                   encoding: URLEncoding.default).responseDecodable{
                    (response: DataResponse<Character, AFError>) in
                    // print(response.value.debugDescription)
                    if let error = response.error{
                        completion(.failure(error: error.localizedDescription))
                    } else {
                        
                        completion(.success(data: response.value))
                    }
                   }
    } */
    
    
}


