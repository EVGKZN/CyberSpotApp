//
//  MatchResultsRouterInput.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol MatchResultsRouterInput: AnyObject {
    
    /// Function for presenting onboarding view
    func presentOnboarding()
    
    /// Function for presenting detail view for match
    /// - Parameter match: Match DTO to present detail view for
    func presentDetailView(for match: MatchDTO)
}
