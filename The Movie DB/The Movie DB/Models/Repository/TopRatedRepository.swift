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
    var realm: Realm
    
    // MARK: - intializers
    init(api: MoyaProvider<MoviesApi>, realm: Realm) {
        self.api = api
        self.realm = realm
    }
    
    // MARK: - methods
    
    /// this function request top rated movies from api
    ///
    /// - Returns: observable array of movie model
    func requestFromApi() -> Observable<[MovieModel]> {
        return api.rx.request(.topRatedMovies)
            .map(to: [MovieModel].self, keyPath: "results")
            .do(onSuccess: { movies in
                
            })
            .asObservable()
    }
    
    /// this function fetch stored movies model from realm
    ///
    /// - Returns: observable array of movie model
    func getFromRealmTopRatedMovie() -> Observable<[MovieModel]> {
        var topMovieList = [MovieModel]()
        for movie in RealmTopRatedMovieModel.getAll(realm: realm) {
            topMovieList.append(MovieModel(managedObject: movie))
        }
        return Observable.just(topMovieList)
    }

    /// this function merge two observable to get data from realm if its has been stored before
    /// if its first time and no data stored befor it fetch api to get dtat and store it for next time
    ///
    /// - Returns: observable array of movie model
    func getTopRatedMovies() -> Observable<[MovieModel]> {
        let apiObservable = requestFromApi().share()
        return Observable.merge(apiObservable, getFromRealmTopRatedMovie().takeUntil(apiObservable).takeWhile { (element) -> Bool in
            return !element.isEmpty
        })
    }
}
