//
//  NetworkManagerServiceImpl.swift
//  CyberSpotApp
//
//  Created by Евгений on 05.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class NetworkManagerServiceImpl: NetworkManagerService {
    
    private let urlConstructor = URLConstructorManager()
    private var pageNumber = Constants.firstPageNumberToLoadMoreMatches
    
    func loadMatches(completion: @escaping ([Match]) -> Void) {
        
        var matches: [Match] = []
        
        guard let url = URL(string: urlConstructor.getMatchesAPIUrl(with: pageNumber))
            else {
                completion(matches)
                return
                
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                matches = try decoder.decode([Match].self, from: data)
                self.pageNumber += Constants.pageNumberIncreaseValue
                completion(matches)
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
    func refreshMatches() {
        self.pageNumber = Constants.firstPageNumberToLoadMoreMatches
    }
    
    func isConnectedToNetwork() -> Bool {
        if ReachabilityManager.isConnectedToNetwork() {
            return true
        } else {
            return false
        }
    }
}
