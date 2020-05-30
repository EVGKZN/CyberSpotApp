//
//  MatchResultsInteractor.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class MatchResultsInteractor: MatchResultsInteractorInput {
    
    weak var presenter: MatchResultsInteractorOutput!
    var newUserService: NewUserService!
    var networkManager: NetworkManagerService!
    var responseToDTOConverter: ReponseToDTOConverterService!
    var settingsConfigurationService: SettingsConfigurationService!
    var databaseManager: RealmDatabaseManagerService!
    var notificationManager: NotificationManagerService!
    
    func checkIfUserNew() {
        if newUserService.isUserNew() { presenter.didFinishChekingNewUser() }
    }
    
    func loadMatches() {
        networkManager.loadMatches { [weak self] matches in
            self?.presenter.didFinishLoadingMatches(matches: matches)
        }
    }
    
    func convertLoadedMatches(matches: [Match]) {
        let convertedMatches = responseToDTOConverter.convertToDTO(matches: matches)
        presenter.didFinishConvertingLoadedMatches(matches: convertedMatches)
    }
    
    func initDefaultConfiguration() {
        settingsConfigurationService.initDefaultConfiguration()
    }
    
    func refreshMatches() {
        networkManager.refreshMatches()
    }
    
    func saveMatch(match: MatchDTO) {
        
        databaseManager.saveMatch(match: match) { isSaved in
            if isSaved { self.notificationManager.notifyToUpdateSavedMatchesView() }
        }
    }
}
