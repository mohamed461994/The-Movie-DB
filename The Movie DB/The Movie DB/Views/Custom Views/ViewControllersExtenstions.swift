//
//  ViewControllersExtenstions.swift
//  The Movie DB
//
//  Created by Mohamed Shaban on 6/22/18.
//  Copyright © 2018 Mohammed Shaban. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupNavigation(vc: UIViewController, title: String) {
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        vc.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white]
        
        vc.navigationController?.navigationBar.isTranslucent = false
        if #available(iOS 11.0, *) {
            vc.navigationItem.largeTitleDisplayMode = .automatic
        }
        
        if #available(iOS 11.0, *) {
            vc.navigationController?.navigationBar.largeTitleTextAttributes = [
                NSAttributedStringKey.foregroundColor: UIColor.white]
        }
        if #available(iOS 11.0, *) {
            vc.navigationController?.navigationBar.prefersLargeTitles = true
        }
        vc.title = title
    }
}
