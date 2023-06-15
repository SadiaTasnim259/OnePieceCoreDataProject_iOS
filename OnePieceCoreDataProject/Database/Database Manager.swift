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
    
    // MARK: - FruitTypeEntity
    
    func addFruitTypeData(_ fruitType:FriutTypeModel ){
        
        let fruitTypeEntity = FruitTypeEntity(context: context) // User create
        fruitTypeEntity.fruitTypeName = fruitType.fruitTypeName
       
        do{
            try context.save()
        }catch{
            print("User saving error:\(error)")
        }
    }
    
    func fetchAllFruitTypeData()-> [FruitTypeEntity]{
        var fruitsType: [FruitTypeEntity] = []
        
        do{
            fruitsType = try context.fetch(FruitTypeEntity.fetchRequest())// user entity r array dibe fetch korle
        }catch{
            print("Fetch user error", error)
        }
         return fruitsType
    }
    
    func fetchAllFruitTypeSearchedData(keyword: String) -> [FruitTypeEntity] {
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
    
    func updateAllFruitTypeData(fruitType: FriutTypeModel, fruitTypeEntity: FruitTypeEntity){
        fruitTypeEntity.fruitTypeName = fruitType.fruitTypeName
        
        do{
            try context.save()
        }catch{
            print("User saving error:\(error)")
        }
    }
    
    func deleteAllFruitTypeData(fruitTypeEntity: FruitTypeEntity){
        context.delete(fruitTypeEntity)
        do{
            try context.save()
        }catch{
            print("User saving error: \(error)")
        }
    }
    
    // MARK: - FruitDetailsEntity data
    
    func addFruitDetailsData(_ fruitDetails:FruitDetailsModel ){
        
        let fruitDetailsEntity = FruitDetailsEntity(context: context)
        fruitDetailsEntity.fruitName = fruitDetails.fruitName
        fruitDetailsEntity.userName = fruitDetails.userName
        fruitDetailsEntity.fruitType = fruitDetails.fruitType
        fruitDetailsEntity.imageURL = fruitDetails.imageURL
       
        do{
            try context.save()
        }catch{
            print("User saving error:\(error)")
        }
    }
    
    func fetchFruitDetailData(type: String) -> [FruitDetailsEntity] {
        var fruitDetails: [FruitDetailsEntity] = []

        let fetchRequest: NSFetchRequest<FruitDetailsEntity> = FruitDetailsEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "fruitType == %@", type)

        do {
            fruitDetails = try context.fetch(fetchRequest)
        } catch {
            print("Fetch user error", error)
        }

        return fruitDetails
    }

}
