//
//  MatchResultsViewInput.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol MatchResultsViewInput: AnyObject {
    func didFinishMatchesLoading(matches: [MatchDTO])
}
