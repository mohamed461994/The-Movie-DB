//
//  TopRatedRepository.swift
//  The Movie DB
//
//  Created by Mohamed Shaban on 6/22/18.
//  Copyright © 2018 Mohammed Shaban. All rights reserved.
//


import RealmSwift
import Moya
import Moya_ModelMapper
import RxSwift

class TopRatedRepository {
    
    // MARK: - properties
    var api: MoyaProvider<MoviesApi>
    var realm: Realm?
    
    // MARK: - intializers
    init(api: MoyaProvider<MoviesApi>, realm: Realm) {
        self.api = api
        self.realm = realm
    }
    
    // MARK: - methods
    
    func requestApi() -> Observable<[TopRatedMovieModel]> {
        return api.rx.request(.topRatedMovies)
            .map(to: [TopRatedMovieModel].self, keyPath: "results")
            .do(onSuccess: { movies in
                print(movies)
            })
            .asObservable()
    }

}
