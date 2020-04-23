//
//  MatchResultsInteractorOutput.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol MatchResultsInteractorOutput: AnyObject {
    func didFinishChekingNewUser()
    func didFinishLoadingMatches(matches: [Match])
    func didFinishConvertingFirstLoadedMatches(matches: [MatchDTO])
    func didFinishLoadingMoreMatches(matches: [Match])
    func didFinishConvertingMoreLoadedMatches(matches: [MatchDTO])
}
