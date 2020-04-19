//
//  URLConstructorManager.swift
//  CyberSpotApp
//
//  Created by Евгений on 19.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class URLConstructorManager {
    
    func getMatchesAPIUrl() -> String {
        
        guard let videogamesIdArray = UserDefaults.standard.array(forKey: Constants.userDefaultsVideogamesIdArrayKey) as? [Int] else { return Constants.emptyString }
        
        var videogameFilter = Constants.emptyString
        var isElementFirst = true
        
        for id in videogamesIdArray {
            
            if isElementFirst {
                
                isElementFirst = false
                videogameFilter.append("\(id)")
            } else {
                videogameFilter.append(",\(id)")
            }
        }
        
        if videogameFilter == Constants.emptyString {
            return Constants.emptyString
        } else {
            return "https://api.pandascore.co/matches/past?sort=-end_at&filter[videogame]=\(videogameFilter)&page[size]=30&token=Y3WnVBNBbUh54mUUZozfLIi7MzPz6ZiEAYIBxUNi5uG6nD71i14"
        }
    }
}
