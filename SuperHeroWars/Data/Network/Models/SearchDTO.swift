//
//  SearchDTO.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 11/3/21.
//

import Foundation

class SearchDTO: Codable{
    
    let response: String
    let results: [CharacterDTO]
    
}
