//
//  MatchResultsInteractorOutput.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol MatchResultsInteractorOutput: AnyObject {
    
    /// Function for checking if user is new in the app completion
    func didFinishChekingNewUser()
    
    /// Function for loading matches from the API completion
    /// - Parameter matches: Matches network models, that have been downloaded
    func didFinishLoadingMatches(matches: [Match])
    
    /// Function for converting matches network models
    /// - Parameter matches: Matches DTO, that have been converted
    func didFinishConvertingLoadedMatches(matches: [MatchDTO])
}
