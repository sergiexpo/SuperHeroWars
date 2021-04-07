//
//  Character.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 2/3/21.
//

import Foundation

enum CharacterAlignment: String{  //Valores por los que se podrá filtrar en las listas
    case good = "good"
    case bad = "bad"
    case neutral = "neutral"
}

enum CharacterPublisher: String{  //Valores por los que se podrá filtrar en las listas
    case dCComics = "DC Comics"
    case marvel = "Marvel"
}

class CharacterDTO: Codable {
    
    
    let id: String
    let name: String
    let powerstats: PowerStatsDTO
    let appearance: AppearanceDTO
    let biography: BiographyDTO
    let work: WorkDTO
    let connections: ConnectionsDTO
    let image: ImageDTO
    
    init(id: String, name: String, powerstats: PowerStatsDTO, appearance: AppearanceDTO, biography: BiographyDTO, work: WorkDTO, connections: ConnectionsDTO, image: ImageDTO) {
        self.id = id
        self.name = name
        self.powerstats = powerstats
        self.appearance = appearance
        self.biography = biography
        self.work = work
        self.connections = connections
        self.image = image
    }
        

}
    

class PowerStatsDTO: Codable{
    
    let intelligence, strength, speed, durability, power, combat: String
    
    var averagePower: Int{
        
        let int = (Int(intelligence) ?? 0)
        let str = (Int(strength) ?? 0)
        let spe = (Int(speed) ?? 0)
        let dur = (Int(durability) ?? 0)
        let pow = (Int(power) ?? 0)
        let com = (Int(combat) ?? 0)
        
        return (int + str + spe + dur + pow + com) / 6
    }
    
    init(intelligence: String, strength: String, speed: String, durability: String, power: String, combat: String) {
        self.intelligence = intelligence
        self.strength = strength
        self.speed = speed
        self.durability = durability
        self.power = power
        self.combat = combat
    }
    
}


class AppearanceDTO: Codable {
    let gender, race: String?
    let height, weight: [String]
    let eyeColor, hairColor: String
    
    enum CodingKeys: String, CodingKey {
         case gender, race, height, weight
         case eyeColor = "eye-color"
         case hairColor = "hair-color"
     }
    
    init(gender: String?, race: String?, height: [String], weight: [String], eyeColor: String, hairColor: String) {
        self.gender = gender
        self.race = race
        self.height = height
        self.weight = weight
        self.eyeColor = eyeColor
        self.hairColor = hairColor
    }
}


class BiographyDTO: Codable {
    let fullName, alterEgos: String
    let aliases: [String]
    let placeOfBirth, firstAppearance: String
    let publisher: String?
    let alignment: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case aliases
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher, alignment
    }

    
    init(fullName: String, alterEgos: String, aliases: [String], placeOfBirth: String, firstAppearance: String, publisher: String?, alignment: String) {
        self.fullName = fullName
        self.alterEgos = alterEgos
        self.aliases = aliases
        self.placeOfBirth = placeOfBirth
        self.firstAppearance = firstAppearance
        self.publisher = publisher
        self.alignment = alignment
    }
}


class WorkDTO: Codable {
    let occupation, base: String
    
    init(occupation: String, base: String) {
        self.occupation = occupation
        self.base = base
    }
}


class ConnectionsDTO: Codable {
    let groupAffiliation, relatives: String
    
    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }
    
    init(groupAffiliation: String, relatives: String) {
        self.groupAffiliation = groupAffiliation
        self.relatives = relatives
    }
}


class ImageDTO: Codable {
    let url: String
    
    init(url: String) {
        self.url = url
    }
}




