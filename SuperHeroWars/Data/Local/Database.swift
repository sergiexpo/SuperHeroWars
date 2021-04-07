//
//  Database.swift
//  SuperHeroWars
//
//  Created by Sergi Exposito on 1/3/21.
//

import UIKit
import CoreData


/*
 Es de ejemplo para saber. No tiene funcionalidad en este proyecto
 */


class Database{
    
    private var managedObjectContext: NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    
 /*   func save (id: Int, name: String){
        guard let moc = managedObjectContext else{
            return
        }
        
        //Obetenemos la entidad 'Person' asociada al ManagedObjectContext
        let entityCharacter = NSEntityDescription.entity(forEntityName: "Character", in: moc)
        
        //De la entidad "entityCharacter" creamos un objeto "Character" para insertar el ManagedObjectContext
        let characterToSave = NSManagedObject(entity: entityCharacter!, insertInto: moc)
    
        //Seteamos los valores de los atributos del objeto
        characterToSave.setValue(id, forKey: "id")
        characterToSave.setValue(id, forKey: "name")
    
        // Persistir en CoreData todos los cambios del ManagedObjectContext
        try? moc.save()
    } */
    
    
    func createCharacter(){
        //Obtenemos el ManagedObjectContext
        guard let moc = managedObjectContext,
              let entityCharacter = NSEntityDescription.entity(forEntityName: "Character", in: moc) else{
            return
        }
        
        let ch1 = NSManagedObject(entity: entityCharacter, insertInto: moc)
        ch1.setValue(23, forKey: "id")
        ch1.setValue("Thor", forKey: "name")
        
        let ch2 = NSManagedObject(entity: entityCharacter, insertInto: moc)
        ch1.setValue(33, forKey: "id")
        ch1.setValue("Captain America", forKey: "name")
        
        let ch3 = NSManagedObject(entity: entityCharacter, insertInto: moc)
        ch1.setValue(43, forKey: "id")
        ch1.setValue("Thanos", forKey: "name")
        
        try? moc.save()
    }
 
    
    func loadCharacters(){
        let fecthCharacter = NSFetchRequest<NSManagedObject>(entityName: "Character")
        guard let moc = managedObjectContext,
              let characters = try? moc.fetch(fecthCharacter) else{
            return
        }
        
        print("Characters: \(characters)")
        
    }
    
    
    
}
