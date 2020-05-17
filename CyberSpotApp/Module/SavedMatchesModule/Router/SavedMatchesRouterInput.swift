//
//  SavedMatchesRouterInput.swift
//  CyberSpotApp
//
//  Created by Евгений on 17.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol SavedMatchesRouterInput: AnyObject {
    func presentDetailView(for match: MatchDTO)
}
