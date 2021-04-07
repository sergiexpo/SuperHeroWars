//
//  CharacterBattleViewData.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 17/3/21.
//

import Foundation

struct CharacterBattleViewData {
    var id: String?
    var imageCharacter: String?
    var name: String?
}


class CharacterBattleViewDataMapper {
    static func map (entity: CharacterEntity?) -> CharacterBattleViewData? {
        guard let entityData = entity else {
            return nil
        }
        
        return CharacterBattleViewData(id: entityData.id,
                                       imageCharacter: entityData.image?.url ?? "",
                                       name: entityData.name ?? "")
    }
}
