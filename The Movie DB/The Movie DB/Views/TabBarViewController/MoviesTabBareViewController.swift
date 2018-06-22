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
        
        let firstViewController = UINavigationController(rootViewController: storyBoard.instantiateViewController(withIdentifier: "TopMovies"))
        setTabBarItemValues(viewController: firstViewController, title: "History", image: nil)
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        
        let secondViewController = UINavigationController(rootViewController: storyBoard.instantiateViewController(withIdentifier: "TopMovies")) //(rootViewController: ))
        setTabBarItemValues(viewController: secondViewController, title: "Search", image: nil)
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        
        let tabBarList = [firstViewController, secondViewController]
        viewControllers = tabBarList
    }
    
    func setTabBarItemValues(viewController: UIViewController, title: String, image: UIImage?) {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        viewController.tabBarItem.tag = 900
    }

    
    
}
