//
//  MatchResultsViewInput.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol MatchResultsViewInput: AnyObject {
    
    /// Function for loading matches from the API completion
    /// - Parameter matches: Matches network models, that have been downloaded
    func didFinishMatchesLoading(matches: [MatchDTO])
}
