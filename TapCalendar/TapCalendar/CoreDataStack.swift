//
//  CoreDataStack.swift
//  TapCalendar
//
//  Created by Daniel Lau on 11/11/18.
//  Copyright © 2018 Daniel. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let container: NSPersistentContainer = {
        
        //create container
        let container = NSPersistentContainer(name: "DataModel")
        //this line is loading
        container.loadPersistentStores(completionHandler: { (storeDesscription, error) in
            if let error = error {
                fatalError("Error loading from CoreData: \(error.localizedDescription)")
            }
            
        })
        return container
    }()
    //we will give directions
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
    //the above code just makes it easier
    
    
}
