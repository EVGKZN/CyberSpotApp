//
//  MatchResultsViewOutput.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol MatchResultsViewOutput: AnyObject {
    
    /// Function for checking if user is new in the app
    func checkIfUserNew()
    
    /// Function for loading matches from the API
    func loadMatches()
    
    /// Function for initialization default app configuration
    func initDefaultConfiguration()
    
    /// Function for calling network manager to refresh matches
    func refreshMatches()
    
    /// Function for saving match to database
    /// - Parameter match: Match DTO to save to database
    func saveMatch(match: MatchDTO)
    
    /// Function for cell click processing
    /// - Parameter match: Match DTO, whoose cell was clicked
    func didPressCell(with match: MatchDTO)
}
