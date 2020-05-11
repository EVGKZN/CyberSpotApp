//
//  SavedMatchesInteractorInput.swift
//  CyberSpotApp
//
//  Created by Евгений on 11.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol SavedMatchesInteractorInput: AnyObject {
    
    func loadMatches()
    func deleteMatch(match: MatchDTO)
}
