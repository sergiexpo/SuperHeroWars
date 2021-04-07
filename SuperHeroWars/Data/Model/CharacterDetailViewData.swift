//
//  CharacterDetailViewData.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 17/3/21.
//

import Foundation

struct CharacterDetailViewData{
  
    var imageCharacter: String?
    var name: String?
    var averagePower: Int16?
    var alignment: String?
    var intelligence: Int16?
    var strength: Int16?
    var speed: Int16?
    var durability: Int16?
    var power: Int16?
    var combat: Int16?
    var race: String?
    var gender: String?
    var publisher: String?
    var fullName: String?
    var placeOfBirth: String?
    var firstAppearance: String?
    var base: String?
    var ocupation: String?
    var groupAffiliation: String?
    
}

class CharacterDetailViewDataMapper{
    static func map (entity: CharacterEntity) -> CharacterDetailViewData{
        
        CharacterDetailViewData(imageCharacter:  entity.image?.url ?? "",
                                name: entity.name ?? "",
                                averagePower: entity.powerStats?.averagePower ?? 0,
                                alignment: entity.biography?.alignment ?? "neutral",
                                intelligence: entity.powerStats?.intelligence ?? 0,
                                strength: entity.powerStats?.strength ?? 0,
                                speed: entity.powerStats?.speed ?? 0,
                                durability: entity.powerStats?.durability ?? 0,
                                power: entity.powerStats?.intelligence ?? 0,
                                combat: entity.powerStats?.intelligence ?? 0,
                                race: entity.appearance?.race ?? "Undefined",
                                gender: entity.appearance?.gender ?? "Undefined",
                                publisher: entity.biography?.publisher ?? "Unknown",
                                fullName: entity.biography?.fullName ?? "Unknown",
                                placeOfBirth: entity.biography?.placeOfBirth ?? "Unknown",
                                firstAppearance: entity.biography?.firstAppearance ?? "Unknown",
                                base: entity.work?.base ?? "Unknown",
                                ocupation: entity.work?.occupation ?? "Unknown",
                                groupAffiliation: entity.connections?.groupAffiliation ?? "Unknown")
        
    }
    
}


