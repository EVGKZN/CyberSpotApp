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
        interactor.convertFirstLoadedMatches(matches: matches)
    }
    
    func didFinishConvertingFirstLoadedMatches(matches: [MatchDTO]) {
        view.didFinishMatchesLoading(matches: matches)
    }
    
    func initDefaultConfiguration() {
        interactor.initDefaultConfiguration()
    }
    
    func loadMoreMatches() {
        interactor.loadMoreMatches()
    }
    
    func didFinishLoadingMoreMatches(matches: [Match]) {
        interactor.convertMoreLoadedMatches(matches: matches)
    }
    
    func didFinishConvertingMoreLoadedMatches(matches: [MatchDTO]) {
        view.didFinishLoadingMoreMatches(matches: matches)
    }
}
