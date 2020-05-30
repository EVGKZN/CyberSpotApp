//
//  SavedMatchesInteractorOutput.swift
//  CyberSpotApp
//
//  Created by Евгений on 11.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol SavedMatchesInteractorOutput: AnyObject {
    
    /// Function for matches loading completion
    /// - Parameter matches: Array of loaded from database matches DTO
    func didFinishLoadingMatches(matches: [MatchDTO])
    
    /// Function for match deleting completion
    func didFinishDeletingMatch()
}
