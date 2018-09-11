//
//  TopRatedMoviesViewModel.swift
//  The Movie DB
//
//  Created by Mohamed Shaban on 6/22/18.
//  Copyright © 2018 Mohammed Shaban. All rights reserved.
//

import RxSwift
import RxCocoa
import Moya

class TopRatedMoviesViewModel {
    
    // MARK:- Properties
    let topRatedRepo: MovieRepository
    var topRatedMovies = BehaviorRelay<[MovieModel]>(value: [])
    var upcomingMovies = BehaviorRelay<[MovieModel]>(value: [])
    var popularMovies = BehaviorRelay<[MovieModel]>(value: [])
    var nowPlayinggMovies = BehaviorRelay<[MovieModel]>(value: [])
    let disposeBag = DisposeBag()

    // MARK:- Intializers
    init(topRatedRepo: MovieRepository) {
        self.topRatedRepo = topRatedRepo
    }
    
    // MARK:- Methods
    
    func bind() {
        // Top Movies
        topRatedRepo.getTopRatedMovies().subscribe(onNext: { [weak self] moviesResponse in
            self?.topRatedMovies.accept(moviesResponse)
        }, onError: { _ in
            // TODO:-
        }).disposed(by: disposeBag)
        
        // Up Comming
        topRatedRepo.api.rx.request(.upcomingMovies)
            .map(to: [MovieModel].self, keyPath: "results")
            .subscribe(onSuccess: { [weak self] upcomingMoviesResponse in
                self?.upcomingMovies.accept(upcomingMoviesResponse)
                }, onError: { _ in
                    // TODO :-
            }).disposed(by: disposeBag)
        
        // Now Playing
        topRatedRepo.api.rx.request(.nowPlaying)
            .map(to: [MovieModel].self, keyPath: "results")
            .subscribe(onSuccess: { [weak self] upcomingMoviesResponse in
                self?.nowPlayinggMovies.accept(upcomingMoviesResponse)
                }, onError: { _ in
                    // TODO :-
            }).disposed(by: disposeBag)
    }
}
