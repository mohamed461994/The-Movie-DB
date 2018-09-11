//
//  MoviesApi.swift
//  The Movie DB
//
//  Created by Mohamed Shaban on 6/22/18.
//  Copyright © 2018 Mohammed Shaban. All rights reserved.
//

import Moya

enum MoviesApi {
    case topRatedMovies
    case upcomingMovies
    case nowPlaying
}

extension MoviesApi: TargetType {
    var baseURL: URL {
        return URL(string: mainPath)!
    }
    
    var path: String {
        switch self {
        case .topRatedMovies:
            return "top_rated"
        case .upcomingMovies:
            return "upcoming"
        case .nowPlaying:
            return "now_playing"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .topRatedMovies, .upcomingMovies, .nowPlaying:
            return .requestParameters(parameters: ["api_key": "1e11705a93fb1729845e86a2b7a40837"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var sampleData: Data {
        switch self {
        case .topRatedMovies:
            return "".data(using: .utf8)!
        case .upcomingMovies:
            return "".data(using: .utf8)!
        case .nowPlaying:
            return "".data(using: .utf8)!
        }
    }
}
