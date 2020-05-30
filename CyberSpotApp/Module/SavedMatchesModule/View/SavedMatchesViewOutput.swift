//
//  SavedMatchesViewOutput.swift
//  CyberSpotApp
//
//  Created by Евгений on 11.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol SavedMatchesViewOutput: AnyObject {
    
    /// Function for loading matches from database
    func loadMatches()
    
    /// Function for deleting concrete match
    /// - Parameter match: Match DTO to delete from database
    func deleteMatch(match: MatchDTO)
    
    /// Function for cell click processing
    /// - Parameter match: Match DTO, whoose cell was clicked
    func didPressCell(with match: MatchDTO)
}
