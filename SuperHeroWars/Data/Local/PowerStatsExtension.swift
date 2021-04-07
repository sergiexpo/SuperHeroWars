//
//  PowerStatsExtension.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 16/3/21.
//

import Foundation
import CoreData

extension PowerStatsEntity{
    
    var averagePower: Int16{
        
        let int = intelligence
        let str = strength
        let spe = speed
        let dur = durability
        let pow = power
        let com = combat
        
        return (int + str + spe + dur + pow + com) / 6
    }

    
    
}
