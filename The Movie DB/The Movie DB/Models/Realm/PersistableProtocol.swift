//
//  Persistable.swift
//  The Movie DB
//
//  Created by Mohamed Shaban on 6/22/18.
//  Copyright © 2018 Mohammed Shaban. All rights reserved.
//

import RealmSwift

public protocol Persistable {
    
    associatedtype ManagedObject: RealmSwift.Object
    
    init(managedObject: ManagedObject)
    
    func managedObject() -> ManagedObject
}
