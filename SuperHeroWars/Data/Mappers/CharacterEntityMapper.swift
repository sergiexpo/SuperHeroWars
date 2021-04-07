//
//  CharacterEntityMapper.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 15/3/21.
//

import Foundation
import CoreData

/*Poner las clases en archivos separados

 No hace falta mantener la misma estructra en la clase de la base de daos que en la clase DTO. Así, podemos tener una base de datos menos compleja
 
 Por ejemplo, para la imagen, no haría falta crear una enttidad. Podríamos  poner la imagen como un atributo en la clase CharacterEntityMapper. Lo mismo por ejemplo, para el Work (eliminar la entidad y poner los atributo en la CharacterEntityMapper)
 
 
*/
 
class CharacterEntityMapper {
    static func map(_ characterDTO: CharacterDTO, context: NSManagedObjectContext) -> CharacterEntity? {
        guard let characterEntity = NSEntityDescription.insertNewObject(forEntityName: "CharacterEntity",
                                                                        into: context) as? CharacterEntity else {
            return nil
        }
        
        characterEntity.id = characterDTO.id
        characterEntity.name = characterDTO.name
        
        characterEntity.powerStats = PowerStatsEntityMapper.map(characterDTO.powerstats, context: context)
        characterEntity.biography = BiographyEntityMapper.map(characterDTO.biography, context: context)
        characterEntity.appearance = AppearanceEntityMapper.map(characterDTO.appearance, context: context)
        characterEntity.connections = ConnectionsEntityMapper.map(characterDTO.connections, context: context)
        characterEntity.image = ImageEntityMapper.map(characterDTO.image, context: context)
        characterEntity.work = WorkEntityMapper.map(characterDTO.work, context: context)
        
        return characterEntity
    }
}

class PowerStatsEntityMapper {
    static func map(_ powerStatsDTO: PowerStatsDTO, context: NSManagedObjectContext) -> PowerStatsEntity? {
        guard let powerStatsEntity = NSEntityDescription.insertNewObject(forEntityName: "PowerStatsEntity",
                                                                         into: context) as? PowerStatsEntity else{
            return nil
        }
        
        powerStatsEntity.intelligence = Int16(powerStatsDTO.intelligence) ?? 0
        powerStatsEntity.combat = Int16(powerStatsDTO.combat) ?? 0
        powerStatsEntity.durability = Int16(powerStatsDTO.durability) ?? 0
        powerStatsEntity.speed = Int16(powerStatsDTO.speed) ?? 0
        powerStatsEntity.strength = Int16(powerStatsDTO.strength) ?? 0
        powerStatsEntity.power = Int16(powerStatsDTO.power) ?? 0
        
        return powerStatsEntity
    }
}

class BiographyEntityMapper {
    static func map(_ biographyDTO: BiographyDTO, context: NSManagedObjectContext) -> BiographyEntity? {
       guard let biographyEntity = NSEntityDescription.insertNewObject(forEntityName: "BiographyEntity",
                                                                into: context) as? BiographyEntity else{
   return nil
}
        
        biographyEntity.alignment = biographyDTO.alignment
        biographyEntity.aliases = biographyDTO.aliases
        biographyEntity.alterEgos = biographyDTO.alterEgos
        biographyEntity.firstAppearance = biographyDTO.firstAppearance
        biographyEntity.fullName = biographyDTO.fullName
        biographyEntity.placeOfBirth = biographyDTO.placeOfBirth
        biographyEntity.publisher = biographyDTO.publisher
        
        return biographyEntity
    }
}

class ConnectionsEntityMapper{
    static func map(_ connectionsDTO: ConnectionsDTO, context: NSManagedObjectContext) -> ConnectionsEntity?{
      guard let connectionsEntity = NSEntityDescription.insertNewObject(forEntityName: "ConnectionsEntity",
                                                                         into: context) as? ConnectionsEntity else{
            return nil
         }
        
        connectionsEntity.groupAffiliation = connectionsDTO.groupAffiliation
        connectionsEntity.relatives = connectionsDTO.relatives
        
        return connectionsEntity
    }
}

class WorkEntityMapper{
    static func map(_ workDTO: WorkDTO, context: NSManagedObjectContext) -> WorkEntity?{
       guard let workEntity = NSEntityDescription.insertNewObject(forEntityName: "WorkEntity",
                                                                  into: context) as? WorkEntity else{
     return nil
  }
        
        workEntity.base = workDTO.base
        workEntity.occupation = workDTO.occupation
        
        return workEntity
    }
}

class AppearanceEntityMapper{
    static func map(_ appearanceDTO: AppearanceDTO, context: NSManagedObjectContext) -> AppearanceEntity?{
       guard let appearanceEntity = NSEntityDescription.insertNewObject(forEntityName: "AppearanceEntity",
                                                                        into: context) as? AppearanceEntity else{
           return nil
        }

        
        appearanceEntity.eyeColor = appearanceDTO.eyeColor
        appearanceEntity.hairColor = appearanceDTO.hairColor
        appearanceEntity.height = appearanceDTO.height
        appearanceEntity.weight = appearanceDTO.weight
        appearanceEntity.gender = appearanceDTO.gender
        appearanceEntity.race = appearanceDTO.race
        
        return appearanceEntity
    }
}

class ImageEntityMapper{
    static func map(_ imageDTO: ImageDTO, context: NSManagedObjectContext) -> ImageEntity?{
       guard let imageEntity = NSEntityDescription.insertNewObject(forEntityName: "ImageEntity",
                                                                   into: context) as? ImageEntity else{
      return nil
   }
        
        imageEntity.url = imageDTO.url
        
        return imageEntity
    }
}
