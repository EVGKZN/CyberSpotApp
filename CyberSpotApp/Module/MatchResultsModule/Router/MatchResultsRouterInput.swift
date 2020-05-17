//
//  MatchResultsRouterInput.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol MatchResultsRouterInput: AnyObject {
    func presentOnboarding()
    func presentDetailView(for match: MatchDTO)
}
