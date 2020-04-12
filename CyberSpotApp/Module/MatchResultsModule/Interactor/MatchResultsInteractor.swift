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
    
    func checkIfUserNew() {
        if newUserService.isUserNew() { presenter.didFinishChekingNewUser() }
    }
    
    func loadMatches() {
        networkManager.getMacthes { [weak self] matches in
            self?.presenter.didFinishLoadingMatches(matches: matches)
        }
    }
    
    func convertMatches(matches: [Match]) {
        let convertedMatches = responseToDTOConverter.convertToDTO(matches: matches)
        presenter.didFinishConvertingMatches(matches: convertedMatches)
    }
}
