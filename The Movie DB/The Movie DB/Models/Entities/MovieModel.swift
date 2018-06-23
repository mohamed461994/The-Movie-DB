//
//  MovieModel.swift
//  The Movie DB
//
//  Created by Mohamed Shaban on 6/22/18.
//  Copyright © 2018 Mohammed Shaban. All rights reserved.
//

import Mapper

struct MovieModel: Mappable {
    
    let id: Int
    let votAverage: Double
    let title: String
    let popularity: Double
    let posterPath: String
    let backgroundPath: String
    let adult: Bool
    let overview: String
    
    init(map: Mapper) throws {
        id = try map.from("id")
        votAverage = try map.from("vote_average")
        title = try map.from("title")
        popularity = try map.from("popularity")
        posterPath = try map.from("poster_path")
        backgroundPath = try map.from("backdrop_path")
        adult = try map.from("adult")
        overview = try map.from("overview")
    }
}

extension MovieModel: Persistable {
    
    init(managedObject: RealmTopRatedMovieModel) {
        id = managedObject.id
        votAverage = managedObject.votAverage
        title = managedObject.title
        popularity = managedObject.popularity
        posterPath = managedObject.posterPath
        backgroundPath = managedObject.backgroundPath
        adult = managedObject.adult
        overview = managedObject.overview
    }
    
    func managedObject() -> RealmTopRatedMovieModel {
        let realmObj = RealmTopRatedMovieModel()
        realmObj.id = id
        realmObj.votAverage = votAverage
        realmObj.title = title
        realmObj.popularity = popularity
        realmObj.posterPath = posterPath
        realmObj.backgroundPath = backgroundPath
        realmObj.adult = adult
        realmObj.overview = overview
        return realmObj
    }
}
