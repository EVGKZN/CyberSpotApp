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
    
    let urlConstructor = URLConstructorManager()
    private var pageNumber = Constants.firstPageNumberToLoadMoreMatches
    
    func getMacthes(completion: @escaping ([Match]) -> Void) {
        
        var matches: [Match] = []
        
        guard let url = URL(string: urlConstructor.getMatchesAPIUrl()) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                matches = try decoder.decode([Match].self, from: data)
                completion(matches)
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
    func loadMoreMatches(completion: @escaping ([Match]) -> Void) {
        
        var matches: [Match] = []
        
        guard let url = URL(string: urlConstructor.getMatchesAPIUrlWithPageNumber(with: pageNumber)) else { return }
        
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
}
