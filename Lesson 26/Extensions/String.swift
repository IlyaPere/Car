//
//  String.swift
//  Lesson 26
//
//  Created by Илья Петров on 04.04.2021.
//

import UIKit

extension String {
    
    func getSymbol() -> UIImage {
        let configuration = UIImage.SymbolConfiguration.init(pointSize: 50, weight: .light, scale: .default)
        let image = UIImage.init(systemName: self, withConfiguration: configuration)
        
        return image!
    }
}
