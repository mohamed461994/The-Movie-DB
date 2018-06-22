//
//  TopRatedMoviesViewModel.swift
//  The Movie DB
//
//  Created by Mohamed Shaban on 6/22/18.
//  Copyright © 2018 Mohammed Shaban. All rights reserved.
//

import RxSwift
import RxCocoa

class TopRatedMoviesViewModel {
    
    // MARK:- Properties
    let repo: TopRatedRepository
    var topRatedMovies = BehaviorRelay<[TopRatedMovieModel]>(value: [])
    let disposeBag = DisposeBag()
    
    // MARK:- Intializers
    init(repo: TopRatedRepository) {
        self.repo = repo
    }
    
    // MARK:- Methods
    
    func bind() {
        repo.requestFromApi().subscribe(onNext: { [weak self] moviesResponse in
            self?.topRatedMovies.accept(moviesResponse)
        }, onError: { _ in
            
        }).disposed(by: disposeBag)
    }
    
}
