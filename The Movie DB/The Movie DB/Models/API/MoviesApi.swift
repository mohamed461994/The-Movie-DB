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
    
}

extension MoviesApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/movie/")!
    }
    
    var path: String {
        switch self {
        case .topRatedMovies:
            return "top_rated"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var task: Task {
        switch self {
            
        case .topRatedMovies:
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
        }
    }
    
    var validate: Bool { // Treat non 2XX response codes as error (onError)
        return true
    }
}
