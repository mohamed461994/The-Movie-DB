//
//  MoviesNavigations.swift
//  The Movie DB
//
//  Created by Mohamed Shaban on 6/22/18.
//  Copyright © 2018 Mohammed Shaban. All rights reserved.
//

import UIKit

class MoviesNavigations: UINavigationBar {

    // MARK: - Initializers
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    // MARK: - Methods
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setupView()
    }
    
    func setupView() {

        
        if #available(iOS 11.0, *) {
            self.largeTitleTextAttributes = [
                NSAttributedStringKey.foregroundColor: UIColor.white]
        }
        self.barTintColor = .black
        self.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        if #available(iOS 11.0, *) {
            self.prefersLargeTitles = true
        }
     
    }

}
