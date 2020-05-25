//
//  SavedMatchesInteractor.swift
//  CyberSpotApp
//
//  Created by Евгений on 11.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class SavedMatchesInteractor: SavedMatchesInteractorInput {
    
    weak var presenter: SavedMatchesInteractorOutput!
    var databaseManager: RealmDatabaseManagerService!
    
    func loadMatches() {
        
        let matches = databaseManager.getMatches()
        presenter.didFinishLoadingMatches(matches: matches)
    }
    
    func deleteMatch(match: MatchDTO) {
        
        databaseManager.deleteMatch(match: match) {
            self.presenter.didFinishDeletingMatch()
        }
    }
}
