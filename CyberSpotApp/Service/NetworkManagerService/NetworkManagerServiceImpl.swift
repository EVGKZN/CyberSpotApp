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
    
    func getMacthes() {
        guard let url = URL(string: "https://api.pandascore.co/matches/past?sort=-end_at&filter[videogame]=3,4&page[size]=3&token=Y3WnVBNBbUh54mUUZozfLIi7MzPz6ZiEAYIBxUNi5uG6nD71i14") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                print("Started matches decoding")
                let matches = try decoder.decode([Match].self, from: data)
                print(matches[1].results)
            } catch let jsonError {
                print(jsonError)
            }
            
        }.resume()
    }
}
