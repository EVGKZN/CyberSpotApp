//
//  DetailViewConfigureProtocol.swift
//  CyberSpotApp
//
//  Created by Евгений on 16.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol DetailViewConfigureProtocol {
    
    /// Function for configuration any part with any item
    /// - Parameter item: Any item
    func configure(with item: Any?)
}
