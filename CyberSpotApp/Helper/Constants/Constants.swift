//
//  Keys.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

struct Constants {
    
    //MARK: - Tab Bat Controller Constants
    static let tabBarControllerMainBarNumber = 1
    
    //MARK: - Date Constants
    static let localeIdentifier = "ru_RU"
    static let iso8601DateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    static let customDateFormat = "dd.MM.yyyy HH:mm"
    
    //MARK: - Network Constants
    static let apiMatchesStringUrl = "https://api.pandascore.co/matches/past?sort=-end_at&filter[videogame]=4,3&page[size]=30&token=Y3WnVBNBbUh54mUUZozfLIi7MzPz6ZiEAYIBxUNi5uG6nD71i14"
    
    //MARK: - UserDefaults Keys Constants
    static let userDefaultsNewUserKey = "isUserNew"
    
    //MARK: - Useful Formatting String Constants
    static let undefinedStatus = "Неизвестно"
    static let emptyString = ""
    
    //MARK: - ViewControllers Names Constants
    static let onboardingViewControllerName = "OnboardingViewController"
    
    //MARK: - Videogame Names Constants
    static let dota2Name = "Dota 2"
    static let csgoName = "CS:GO"
    
    //MARK: - Videogame Image Names Constants
    static let dota2ImageName = "dota2OnIcon"
    static let csgoImageName = "csgoOnIcon"
    
    //MARK: - Cell Configuration Constants
    static let firstOpponentNumber = 0
    static let secondOpponentNumber = 1
    static let placeholderImageName = "cyberSpotLogo"
    static let preferredHeight = 200
    
    //MARK: - Custom Cell's Reuse Identifiers Constants
    static let customMatchCellReuseIdentifier = "customMatchCell"
    
    //MARK: - Custom Cell's Nib Names Constants
    static let customMatchCellNibName = "MatchTableViewCell"
    
    //MARK: - Settings View Button's Images
    static let csgoOnIconImage = "csgoOnIcon"
    static let csgoOffIconImage = "csgoOffIcon"
    static let dota2OnIconImage = "dota2OnIcon"
    static let dota2OffIconImage = "dota2OffIcon"
    
    //MARK: - Settings View Vieogame's Ids
    static let defaultCSGOVideogameId = 3
    static let defaultDota2VideogameId = 4
    
    static let defaultVideogamesIdArray = [3,4]
    static let userDefaultsVideogamesIdArrayKey = "videogamesIdArray"
}

