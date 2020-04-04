//
//  MatchResultsInteractor.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class MatchResultsInteractor: MatchResultsInteractorInput {
    
    weak var presenter: MatchResultsInteractorOutput!
    var newUserService: NewUserService!
    
    func checkIfUserNew() {
        if newUserService.isUserNew() { presenter.didFinishChekingNewUser() }
    }
}
