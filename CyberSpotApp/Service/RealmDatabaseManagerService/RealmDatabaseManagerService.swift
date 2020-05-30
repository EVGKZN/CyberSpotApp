//
//  RealmDatabaseManagerService.swift
//  CyberSpotApp
//
//  Created by Евгений on 11.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol RealmDatabaseManagerService {
    
    /// Function for saving match DTO to database
    /// - Parameters:
    ///   - match: Macth to save to database
    ///   - completion: Completion for function
    func saveMatch(match: MatchDTO, completion: @escaping (Bool) -> Void)
    
    /// Function for getting array of matches DTO from database
    func getMatches() -> [MatchDTO]
    
    /// Function for deleting match DTO from database
    /// - Parameters:
    ///   - match: Match to delete from database
    ///   - completion: Completion for function
    func deleteMatch(match: MatchDTO, completion: @escaping () -> Void)
}
