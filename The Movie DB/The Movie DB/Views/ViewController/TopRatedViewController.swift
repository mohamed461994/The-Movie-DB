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

class TopRatedViewController: UIViewController {

    var viewModel: TopRatedMoviesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        injectDependencies()
        
    }

    func injectDependencies() {
        // inject repository with its dependancies
        let topRatedRepository = TopRatedRepository(api: MoyaProvider<MoviesApi>(), realm: try! Realm())
        // inject viewModel with its dependancies
        viewModel = TopRatedMoviesViewModel(repo: topRatedRepository)
    }
}

