//
//  MatchResultsPresenter.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class MatchResultsPresenter: MatchResultsViewOutput, MatchResultsInteractorOutput {
    
    weak var view: MatchResultsViewInput!
    var interactor: MatchResultsInteractorInput!
    var router: MatchResultsRouterInput!
    
    func checkIfUserNew() {
        interactor.checkIfUserNew()
    }
    
    func didFinishChekingNewUser() {
        router.presentOnboarding()
    }
    
    func loadMatches() {
        interactor.loadMatches()
    }
    
    func didFinishLoadingMatches(matches: [Match]) {
        interactor.convertLoadedMatches(matches: matches)
    }
    
    func didFinishConvertingLoadedMatches(matches: [MatchDTO]) {
        view.didFinishMatchesLoading(matches: matches)
    }
    
    func initDefaultConfiguration() {
        interactor.initDefaultConfiguration()
    }
    
    func refreshMatches() {
        interactor.refreshMatches()
        interactor.loadMatches()
    }
}
