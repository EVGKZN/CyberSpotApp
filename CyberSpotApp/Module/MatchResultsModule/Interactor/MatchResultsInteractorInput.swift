//
//  MatchResultsInteractorInput.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol MatchResultsInteractorInput: AnyObject {
    
    func checkIfUserNew()
    func loadMatches()
    func convertLoadedMatches(matches: [Match])
    func initDefaultConfiguration()
    func refreshMatches()
}
