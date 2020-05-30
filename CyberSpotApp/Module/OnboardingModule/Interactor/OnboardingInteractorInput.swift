//
//  OnboardingInteractorInput.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol OnboardingInteractorInput: AnyObject {
    
    /// Function for changing new user property in new user service
    func setUserIsNotNew()
}
