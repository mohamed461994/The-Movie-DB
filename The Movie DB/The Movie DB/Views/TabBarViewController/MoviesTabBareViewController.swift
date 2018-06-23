//
//  MoviesTabBareViewController.swift
//  mySharp
//
//  Created by Mohamed Shaban on 6/22/18.
//  Copyright © 2018 Sharp Mobile. All rights reserved.
//

import UIKit

class MoviesTabBareViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViewControllers()
    }
    
    func addViewControllers() {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let MoviesVC = UINavigationController(rootViewController: storyBoard.instantiateViewController(withIdentifier: "TopMovies"))
        setTabBarItemValues(viewController: MoviesVC, image: UIImage(named: "Movies"))
        
        let tvShowsVC = UINavigationController(rootViewController: UIViewController())
        tvShowsVC.setupNavigation(title: "Shows")
        setTabBarItemValues(viewController: tvShowsVC, image: UIImage(named: "TV"))
        
        let searchShowsVC = UINavigationController(rootViewController: UIViewController())
        searchShowsVC.setupNavigation(title: "Search")
        setTabBarItemValues(viewController: searchShowsVC, image: UIImage(named: "Search"))
        
        let moreVC = UINavigationController(rootViewController: UIViewController())
        moreVC.setupNavigation(title: "More")
        setTabBarItemValues(viewController: moreVC, image: UIImage(named: "More"))
        
        let tabBarList = [MoviesVC, tvShowsVC, searchShowsVC, moreVC]
        self.tabBar.tintColor = UIColor.black
        viewControllers = tabBarList
    }
    
    func setTabBarItemValues(viewController: UIViewController, image: UIImage?) {
        viewController.tabBarItem.image = image
        viewController.tabBarItem.tag = 900
    }

    
    
}
