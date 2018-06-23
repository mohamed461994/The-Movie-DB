//
//  ViewControllersExtenstions.swift
//  The Movie DB
//
//  Created by Mohamed Shaban on 6/22/18.
//  Copyright © 2018 Mohammed Shaban. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupNavigation(title: String) {
        
        navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.isTranslucent = false
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .automatic
        }
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [
                NSAttributedStringKey.foregroundColor: UIColor.white]
        }
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        self.title = title
    }
}
