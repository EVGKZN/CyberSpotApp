//
//  OnboardingInteractor.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class OnboardingInteractor: OnboardingInteractorInput {
    
    weak var presenter: OnboardingInteractorOutput!
    var newUserService: NewUserService!
    
    func setUserIsNotNew() {
        newUserService.setUserIsNotNew()
    }
}
