//
//  Calendar + Convenience.swift
//  TapCalendar
//
//  Created by Daniel Lau on 11/11/18.
//  Copyright © 2018 Daniel. All rights reserved.
//

import CoreData
import Foundation

extension Day {
    
    convenience init(isCompleted: Bool, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.isCompleted = isCompleted
    }
}
