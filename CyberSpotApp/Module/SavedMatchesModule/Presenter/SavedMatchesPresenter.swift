//
//  SavedMatchesPresenter.swift
//  CyberSpotApp
//
//  Created by Евгений on 11.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class SavedMatchesPresenter: SavedMatchesViewOutput, SavedMatchesInteractorOutput {
    
    weak var view: SavedMatchesViewInput!
    var interactor: SavedMatchesInteractorInput!
    var router: SavedMatchesRouterInput!
    
    func loadMatches() {
        interactor.loadMatches()
    }
    
    func didFinishLoadingMatches(matches: [MatchDTO]) {
        view.didFinishLoadingMatches(matches: matches)
    }
    
    func deleteMatch(match: MatchDTO) {
        interactor.deleteMatch(match: match)
    }
    
    func didFinishDeletingMatch() {
        view.didFinishDeletingMatch()
    }
    
      func didPressCell(with match: MatchDTO) {
        router.presentDetailView(for: match)
      }
    
}
