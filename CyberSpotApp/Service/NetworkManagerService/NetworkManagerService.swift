//
//  NetworkManagerService.swift
//  CyberSpotApp
//
//  Created by Евгений on 05.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol NetworkManagerService {
    
    /// Function for loading matches from API
    /// - Parameter completion: Completion for function
    func loadMatches(completion: @escaping ([Match]) -> Void)
    
    /// Function for refreshing API matches page counter
    func refreshMatches()
}
