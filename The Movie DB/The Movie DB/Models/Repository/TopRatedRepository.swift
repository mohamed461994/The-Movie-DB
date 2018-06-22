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
    
    func requestFromApi() -> Observable<[TopRatedMovieModel]> {
        return api.rx.request(.topRatedMovies)
            .map(to: [TopRatedMovieModel].self, keyPath: "results")
            .do(onSuccess: { movies in
                print(movies)
            })
            .asObservable()
    }
    
    func getFromRealmTopRatedMovie() -> Observable<[TopRatedMovieModel]> {
        var topMovieList = [TopRatedMovieModel]()
        for movie in RealmTopRatedMovieModel.getAll(realm: realm) {
            topMovieList.append(TopRatedMovieModel(managedObject: movie))
        }
        return Observable.just(topMovieList)
    }

    func getTopRatedMovies() -> Observable<[TopRatedMovieModel]> {
        let apiObservable = requestFromApi().share() // share the observable
        // take date from database until data comes from api
        return Observable.merge(apiObservable, getFromRealmTopRatedMovie().takeUntil(apiObservable).takeWhile { (element) -> Bool in
            return !element.isEmpty
        })
    }
}
