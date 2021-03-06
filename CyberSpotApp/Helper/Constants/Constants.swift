//
//  Keys.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

struct Constants {
    
    //MARK: - Tab Bar Controller Constants
    static let matchResultsTabBarIndex = 1
    static let savedMatchesTabBarIndex = 0
    
    //MARK: - Date Constants
    static let localeIdentifier = "ru_RU"
    static let iso8601DateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    static let customDateFormat = "dd.MM.yyyy HH:mm"
    
    //MARK: - Network Constants
    static let firstPageNumberToLoadMoreMatches = 1
    static let pageNumberIncreaseValue = 1
    
    //MARK: - UserDefaults Keys Constants
    static let userDefaultsNewUserKey = "isUserNew"
    
    //MARK: - Useful Formatting String Constants
    static let undefinedStatus = "Неизвестно"
    static let emptyString = ""
    
    //MARK: - Usedful Formatting Int Constants
    static let undefinedInt = -1
    
    //MARK: - ViewControllers Names Constants
    static let onboardingViewControllerName = "OnboardingViewController"
    static let detailViewControllerName = "MatchDetailViewController"
    
    //MARK: - Videogame Names Constants
    static let dota2Name = "Dota 2"
    static let csgoName = "CS:GO"
    
    //MARK: - Videogame Image Names Constants
    static let dota2ImageName = "dotaIconMini"
    static let csgoImageName = "csgoIconMini"
    
    //MARK: - Cell Configuration Constants
    static let firstOpponentNumber = 0
    static let secondOpponentNumber = 1
    static let placeholderImageName = "cyberSpotLogo"
    static let preferredHeight = 200
    static let additiveSubtrahendForPredownloadingNewMatches = 500
    
    //MARK: - Custom Cell's Reuse Identifiers Constants
    static let customMatchCellReuseIdentifier = "customMatchCell"
    static let customDetailViewGameCollectionViewCellReuseIdentifier = "DetailViewGameCollectionViewCell"
    
    //MARK: - Custom Cell's Nib Names Constants
    static let customMatchResultsCellNibName = "MatchResultsTableViewCell"
    static let customSavedMatchesCellNibName = "SavedMatchesTableViewCell"
    static let customDetailViewGameCollectionViewCellNibName = "GamesCollectionViewCell"
    
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
    
    //MARK: - Notification Center Names Constants
    static let updateMatchesViewNotificationName = "updateMatchesViewNotificationKey"
    static let updateSavedMatchesViewNotificationName = "updateSavedMatchesViewNotificationKey"
    
    //MARK: - Empty Filter Alert Controller Constants
    static let emptyFilterAlertControllerTitle = "Ошибка"
    static let emptyFilterAlertControllerMessage = "Необходимо выбрать хотя бы одну игру для отображения. Измените настройки и попробуйте снова"
    static let emptyFilterOkActionTitle = "Хорошо"
    
    //MARK: - Detail View Label's Constants
    static let gameNumberTextForLabel = "Игра #"
    static let gameWinnerTextForLabel = "Победитель: "
    static let gameDurationTextForLabel = "Длительность: "
    
    //MARK: - System Images Names
    static let heartForMatchesResultLikeButtonSystemImageName = "heart"
    static let filledHeartForMatchesResultLikeButtonSystemImageName = "heart.fill"
}

