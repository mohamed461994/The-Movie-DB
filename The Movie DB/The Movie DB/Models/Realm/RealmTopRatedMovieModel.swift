//
//  RealmMovieModel.swift
//  The Movie DB
//
//  Created by Mohamed Shaban on 6/22/18.
//  Copyright © 2018 Mohammed Shaban. All rights reserved.
//

import RealmSwift

class RealmTopRatedMovieModel: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var votAverage: Double = 0.0
    @objc dynamic var title: String = ""
    @objc dynamic var popularity: Double = 0.0
    @objc dynamic var posterPath: String = ""
    @objc dynamic var backgroundPath: String = ""
    @objc dynamic var adult: Bool = false
    @objc dynamic var overview: String = ""
    
    static func getAll(realm: Realm) -> Results<RealmTopRatedMovieModel> {
        return realm.objects(RealmTopRatedMovieModel.self)
    }
    
    static func deleteAll(realm: Realm) {
        try? realm.write {
            realm.delete(getAll(realm: realm))
        }
    }
    
    
}
