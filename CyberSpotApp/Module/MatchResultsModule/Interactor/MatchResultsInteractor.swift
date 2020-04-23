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
    
    func isConnectedToNetwork() {
        let result = networkManager.isConnectedToNetwork()
        presenter.didFinishCheckingInternetConnection(result: result)
    }
}
