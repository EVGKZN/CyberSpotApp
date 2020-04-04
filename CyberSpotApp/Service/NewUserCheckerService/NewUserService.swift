//
//  NewUserCheckerService.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol NewUserService {
    func isUserNew() -> Bool
    func setUserIsNotNew()
}
