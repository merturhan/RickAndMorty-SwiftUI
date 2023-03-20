//
//  DataController.swift
//  RickAndMorty-SwiftUI
//
//  Created by Mert Urhan on 20.03.2023.
//

import Foundation
import CoreData

class DataController : NSObject, ObservableObject{
    let container = NSPersistentContainer(name: "DataModel")
    
    override init() {
        container.loadPersistentStores {desc, error in
            if let error = error{
                print("Failed to load data \(error.localizedDescription)")
            }
                
        }
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data Saved")
        } catch{
            print("Data couldn't saved")
        }
    }
    
    func addDecider(context: NSManagedObjectContext){
        let decider = Decider(context: context)
        decider.id = UUID()
        decider.isFirstLaunch = false
        
        save(context: context)
    }
    
//    func toggleDecider(decider : Decider, context: NSManagedObjectContext){
//        decider.isFirstLaunch.toggle()
//        print("Now decider is = \(decider.isFirstLaunch)")
//        save(context: context)
//    }
    
}
