//
//  Persistable.swift
//  The Movie DB
//
//  Created by Mohamed Shaban on 6/22/18.
//  Copyright © 2018 Mohammed Shaban. All rights reserved.
//

import RealmSwift

/// this protocol is implemented by model in to be able to transform json mapper model to realm model and the realm model to mapper model to use data from api or realm
public protocol Persistable {
    
    associatedtype ManagedObject: RealmSwift.Object
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}
