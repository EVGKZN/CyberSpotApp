//
//  RealmDatabaseManagerService.swift
//  CyberSpotApp
//
//  Created by Евгений on 11.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol RealmDatabaseManagerService {
    
    func saveMatch(match: MatchDTO, completion: @escaping (Bool) -> Void)
    func getMatches() -> [MatchDTO]
    func deleteMatch(match: MatchDTO)
}
