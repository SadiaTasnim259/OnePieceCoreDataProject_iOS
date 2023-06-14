//
//  Database Manager.swift
//  OnePieceCoreDataProject
//
//  Created by Sadia on 14/6/23.
//

import Foundation
import CoreData
import UIKit

class DatabaseManager{
    
    private var context: NSManagedObjectContext{
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func addData(_ fruitType:FriutTypeModel ){
        
        let fruitTypeEntity = FruitTypeEntity(context: context) // User create
        fruitTypeEntity.fruitTypeName = fruitType.fruitTypeName
       
        do{
            try context.save()
        }catch{
            print("User saving error:\(error)")
        }
    }
    
    func fetchData()-> [FruitTypeEntity]{
        var fruitsType: [FruitTypeEntity] = []
        
        do{
            fruitsType = try context.fetch(FruitTypeEntity.fetchRequest())// user entity r array dibe fetch korle
        }catch{
            print("Fetch user error", error)
        }
         return fruitsType
    }
    
    func fetchSearchedData(keyword: String) -> [FruitTypeEntity] {
        var searchFruitsType: [FruitTypeEntity] = []
        
        let fetchRequest: NSFetchRequest<FruitTypeEntity> = FruitTypeEntity.fetchRequest()
        
        let predicate = NSPredicate(format: "fruitTypeName CONTAINS[c] %@", keyword)
        fetchRequest.predicate = predicate
        
        do {
            searchFruitsType = try context.fetch(fetchRequest)
        } catch {
            print("Fetch user error: \(error.localizedDescription)")
        }
        
        return searchFruitsType
    }
    
}
