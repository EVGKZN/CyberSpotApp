//
//  NetworkManagerService.swift
//  CyberSpotApp
//
//  Created by Евгений on 05.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol NetworkManagerService {
    func loadMatches(completion: @escaping ([Match]) -> Void)
    func refreshMatches()
    func isConnectedToNetwork() -> Bool 
}
