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
    let votAverage: Float
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
