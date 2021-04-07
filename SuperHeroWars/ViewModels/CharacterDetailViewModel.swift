//
//  CharacterDetailViewModel.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 18/3/21.
//

import Foundation

class CharacterDetailViewModel{
    
    var character: CharacterEntity?
    
    
    func onViewConfigured(by characterId: String?, _ onComplete: () -> Void){
        character =  DataManager.shared.fetchCharacter(by: characterId ?? "")
        onComplete()
    }
    /*
     Lo del onComplete es un apaño para, para notificar al view model que la view se ha creado. En mi caso no lo necesito, porque no tengo elementos a mostrar en la view. Todos los elementos estan en las celdas
     */
    
    
    
}
