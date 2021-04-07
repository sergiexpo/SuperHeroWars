//
//  DataManager.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 9/3/21.
//

import UIKit
import CoreData

let keyValueDC1 = "DC1"
let keyValueDC2 = "DC2"
let keyValueDC3 = "DC3"
let keyValueMarvel1 = "M1"
let keyValueMarvel2 = "M2"
let keyValueMarvel3 = "M3"

let keyValues = [keyValueDC1, keyValueDC2, keyValueDC3, keyValueMarvel1, keyValueMarvel2, keyValueMarvel3]

var numberFightersPerTeam: Int = 3


/// The Singleton class defines the `shared` field that lets clients access the
/// unique singleton instance.
class DataManager{
    // MARK: - SINGLETON start -
    /// The static field that controls the access to the singleton instance.
    /// This implementation let you extend the Singleton class while keeping
    /// just one instance of each subclass around.
    static var shared: DataManager = {
        return DataManager()
    }()
    
    /// The Singleton's initializer should always be private to prevent direct
    /// construction calls with the `new` operator.
    private init() {}
    // MARK: - SINGLETON end -
    
    //var defaultCharacters: [CharacterEntity] = []
    
    
    let characterMaxCount = 732
    var loadCharacterObserver: ((_ progress: Float) -> ())? = nil
    var loadCharactersCount = 0 {
        didSet{                     // El observador
            loadCharacterObserver?(Float(loadCharactersCount) / Float (characterMaxCount))
        }
    }
    
    func downloadAllCharacters(){
        for id in 0...characterMaxCount {
            ApiService.shared.fetchHero(by: "\(id)") { [weak self] result in
                switch result {
                    case .success(let data):
                        guard let characterDTO = data as? CharacterDTO,
                              !(characterDTO.id.isEmpty),
                              let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                            // NO usar return porque no sumarías 1 a loadCharactersCount
                            break
                        }
                        
                        let context = appDelegate.persistentContainer.viewContext
                        
                        _ = CharacterEntityMapper.map(characterDTO, context: context)
                        try? context.save()
                            // self?.defaultCharacters.append(characterEntity)
                        
                    case .failure(_):
                        break
                }
                
                self?.loadCharactersCount += 1
            }
        }
        
        /*    guard let pathURL = Bundle.main.url(forResource: "all_characters", withExtension: "json") else {
         print("Can not find `all` resource")
         return
         }
         
         do {
         let data = try Data(contentsOf: pathURL)
         defaultCharacters = try JSONDecoder().decode([CharacterHero].self, from: data)
         } catch {
         print("Can not find `all` resource")
         } */
    }
    
    
    func characters(by publisher: CharacterPublisher) -> [CharacterEntity] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return []
        }
        
        let moc = appDelegate.persistentContainer.viewContext
        let fetchCharacter = NSFetchRequest<NSManagedObject>(entityName: "CharacterEntity")
        fetchCharacter.predicate = NSPredicate(format: "biography.publisher CONTAINS %@", publisher.rawValue)
        
        return (try? moc.fetch(fetchCharacter) as? [CharacterEntity]) ?? []
    }
    
    
    // MARK: - Battle functions
    
    func addHeroToTeam(character: CharacterEntity?, keyValue: String) {
        UserDefaults.standard.setValue(character?.id, forKey: keyValue)
    }
    
    
    func getCharacterFromTeam(keyValue: String) -> CharacterEntity? {
        if let characterId = UserDefaults.standard.string(forKey: keyValue) {
            return fetchCharacter(by: characterId)
        } else {
            return nil
        }
    }
    
    
    func fetchCharacter(by characterId: String) -> CharacterEntity? {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return nil
        }
        
        let moc = appDelegate.persistentContainer.viewContext
        
        let fetchCharacter = NSFetchRequest<NSManagedObject>(entityName: "CharacterEntity")
        fetchCharacter.predicate = NSPredicate(format: "id=%@", characterId)  //Condición para buscar caracter con esa id
        
        let characterFromDB = try?moc.fetch(fetchCharacter).first as? CharacterEntity
        
        return characterFromDB
    }
    
    func isCharacterInTeam(characterId: String?) -> Bool {
        var exists = false
        // TODO: MEJORAR LOGICA
        keyValues.forEach { keyValue in
            let fighter = self.getCharacterFromTeam(keyValue: keyValue)
            if fighter?.id == characterId {
                exists = true
            }
        }
        
        return exists
    }
    
    
    func resetCharactersBattle(){
        UserDefaults.standard.removeObject(forKey: keyValueDC1)
        UserDefaults.standard.removeObject(forKey: keyValueDC2)
        UserDefaults.standard.removeObject(forKey: keyValueDC3)
        UserDefaults.standard.removeObject(forKey: keyValueMarvel1)
        UserDefaults.standard.removeObject(forKey: keyValueMarvel2)
        UserDefaults.standard.removeObject(forKey: keyValueMarvel3)
    }
    
    
    func powerTeam(team: [CharacterEntity?]) -> Int16{
        var power: Int16 = 0
        team.forEach{
            power = power + $0!.powerStats!.averagePower
        }
        return power
    }
    
    func battle(marvel: [CharacterEntity?], dcComics: [CharacterEntity?]) -> String{
        
        if (powerTeam(team: marvel) - powerTeam(team: dcComics)) > 0 {
            return NSLocalizedString("text_result_1", comment: "")
        } else if (powerTeam(team: marvel) - powerTeam(team: dcComics)) < 0 {
            return NSLocalizedString("text_result_2", comment: "")
        } else {
            return NSLocalizedString("text_result_3", comment: "")
        }
    }
    
    
    
    
    
    //********** CORE DATA ***************** //
    
    
    func isCharactersDownloaded() -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return false
        }
        
        let moc = appDelegate.persistentContainer.viewContext
        let fetchCharacter = NSFetchRequest<NSManagedObject>(entityName: "CharacterEntity")
        
        return !((try? moc.fetch(fetchCharacter) as? [CharacterEntity])?.isEmpty ?? true)
    }
    
    
    func removeDB(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        let moc = appDelegate.persistentContainer.viewContext
        
        let fetchCharacters = NSFetchRequest<NSManagedObject>(entityName: "CharacterEntity")
        
        let characters = try? moc.fetch(fetchCharacters)
        
        characters?.forEach{
            moc.delete($0)
        }
        
        
        try? moc.save()
    }
    
    
    // MARK: - List functions
    func filter(characters: [CharacterEntity], by alignment: String) -> [CharacterEntity]{
        var charactersAfter = characters
        charactersAfter.removeAll { !($0.biography?.alignment?.contains(alignment) ?? false)}
        return charactersAfter
    }
}

extension Array {
    var isNotEmpty: Bool {
        count != 0
    }
}
