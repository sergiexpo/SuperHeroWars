//
//  CharacterViewData.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 17/3/21.
//

import Foundation

struct CharacterViewData{
  
    var imageCharacter: String?
    var name: String?
    var alignment: String?
    var race: String?
    var gender: String?
    var weight: String?
    var height: String?
    var intelligence: Int16?
    var strength: Int16?
    var speed: Int16?
    var durability: Int16?
    var power: Int16?
    var combat: Int16?
}


class CharacterViewDataMapper{
    static func map (entity: CharacterEntity) -> CharacterViewData{
        
        CharacterViewData(imageCharacter:  entity.image?.url ?? "",
                                name: entity.name ?? "",
                                alignment: entity.biography?.alignment ?? "neutral",
                                race: entity.appearance?.race ?? "Undefined",
                                gender: entity.appearance?.gender ?? "Undefined",
                                weight: entity.appearance?.weight?[0] ?? "",
                                height: entity.appearance?.height?[0] ?? "",
                                intelligence: entity.powerStats?.intelligence ?? 0,
                                strength: entity.powerStats?.strength ?? 0,
                                speed: entity.powerStats?.speed ?? 0,
                                durability: entity.powerStats?.durability ?? 0,
                                power: entity.powerStats?.intelligence ?? 0,
                                combat: entity.powerStats?.intelligence ?? 0)
        
    }
    
}

