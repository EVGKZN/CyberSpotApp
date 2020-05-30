//
//  NewUserCheckerService.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol NewUserService {
    
    /// Function for checking is user new in the app
    func isUserNew() -> Bool
    
    /// Function for setting, that user is not new in the app
    func setUserIsNotNew()
}
