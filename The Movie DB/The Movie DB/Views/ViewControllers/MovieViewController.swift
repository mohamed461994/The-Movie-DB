//
//  ViewController.swift
//  The Movie DB
//
//  Created by Mohamed Shaban on 6/22/18.
//  Copyright © 2018 Mohammed Shaban. All rights reserved.
//

import UIKit
import RealmSwift
import Moya
import RxCocoa
import RxSwift
import Kingfisher

class MoviesViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var topMoviesCollectionView: UICollectionView!
    @IBOutlet weak var upcomingMoviesCollectionView: UICollectionView!
    @IBOutlet weak var nowPlayingMoviesCollectionView: UICollectionView!

    // MARK: - Properties
    var viewModel: TopRatedMoviesViewModel!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        injectDependencies()
        setupBinding()
        topMoviesCollectionView.delegate = self
        upcomingMoviesCollectionView.delegate = self
        nowPlayingMoviesCollectionView.delegate = self
        setupNavigation(title: "Movies")
        
        
    }
    
    func setupBinding() {
        // Top Rated Bindding
        viewModel.topRatedMovies
            .bind(to: topMoviesCollectionView.rx.items(cellIdentifier: "TopMovieCell", cellType: TopMoviesCollectionViewCell.self)) {
                index, movie, cell in
                cell.title.text = movie.title
                let movieImageUrl = URL(string: imagesBaseURL+movie.posterPath)
                cell.posterImage.kf.setImage(with: movieImageUrl)
            }.disposed(by: viewModel.disposeBag)
        viewModel.bind()
        
        // Up Comming Bindding
        viewModel.upcomingMovies
            .bind(to: upcomingMoviesCollectionView.rx.items(cellIdentifier: "UpcomingMovieCell", cellType: TopMoviesCollectionViewCell.self)) {
                index, movie, cell in
                cell.title.text = movie.title
                let movieImageUrl = URL(string: imagesBaseURL+movie.posterPath)
                cell.posterImage.kf.setImage(with: movieImageUrl)
            }.disposed(by: viewModel.disposeBag)
        viewModel.bind()
        
        // Now Playing
        viewModel.nowPlayinggMovies
            .bind(to: nowPlayingMoviesCollectionView.rx.items(cellIdentifier: "NowPlayingMovieCell", cellType: TopMoviesCollectionViewCell.self)) {
                index, movie, cell in
                cell.title.text = movie.title
                let movieImageUrl = URL(string: imagesBaseURL+movie.posterPath)
                cell.posterImage.kf.setImage(with: movieImageUrl)
            }.disposed(by: viewModel.disposeBag)
        viewModel.bind()
        
        
    }

    func injectDependencies() {
        let topRatedRepository = TopRatedRepository(api: MoyaProvider<MoviesApi>(), realm: try! Realm())
        viewModel = TopRatedMoviesViewModel(topRatedRepo: topRatedRepository)
    }
    
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let cellWidth = (width - 21) / 3
        return CGSize(width: cellWidth, height: cellWidth / 0.6)
    }
}

