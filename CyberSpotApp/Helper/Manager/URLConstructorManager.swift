//
//  URLConstructorManager.swift
//  CyberSpotApp
//
//  Created by Евгений on 19.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class URLConstructorManager {
    
    private func getVideogameFilter() -> String {
        
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
        
        return videogameFilter
    }
    
    func getMatchesAPIUrl(with pageNumber: Int) -> String {
        
        let videogameFilter = getVideogameFilter()
        
        if videogameFilter == Constants.emptyString {
            return Constants.emptyString
        } else {
            return "https://api.pandascore.co/matches/past?sort=-scheduled_at&filter[videogame]=\(videogameFilter)&page[size]=30&page[number]=\(pageNumber)&token=Y3WnVBNBbUh54mUUZozfLIi7MzPz6ZiEAYIBxUNi5uG6nD71i14"
        }
    }
}
