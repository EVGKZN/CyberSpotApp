//
//  NewUserCheckerServiceImpl.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class NewUserServiceImpl: NewUserService {
    
    func isUserNew() -> Bool {
        return !(UserDefaults.standard.object(forKey: Constants.userDefaultsNewUserKey) != nil)
    }
    
    func setUserIsNotNew() {
        UserDefaults.standard.set(true, forKey: Constants.userDefaultsNewUserKey)
    }
}
