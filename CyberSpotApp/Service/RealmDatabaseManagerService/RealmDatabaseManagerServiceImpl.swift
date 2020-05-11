//
//  RealmDatabaseManagerServiceImpl.swift
//  CyberSpotApp
//
//  Created by Евгений on 11.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import RealmSwift

class RealmDatabaseManagerServiceImpl: RealmDatabaseManagerService {
    
    fileprivate lazy var realm = try! Realm(configuration: .defaultConfiguration)
    
    func saveMatch(match: MatchDTO, completion: @escaping (Bool) -> Void) {
        
        var isSaved = false
        DispatchQueue.main.async {
            
            if self.realm.object(ofType: MatchModel.self, forPrimaryKey: match.id) == nil {
                
                let matchModel = match.toModel()
                try! self.realm.write {
                    self.realm.add(matchModel)
                }
                isSaved = true
                completion(isSaved)
            }
        }
    }
    
    func getMatches() -> [MatchDTO] {
        
        let models = realm.objects(MatchModel.self)
        var matchesDTO: [MatchDTO] = []
        
        for model in models {
            matchesDTO.append(model.toDto())
        }
        
        return matchesDTO
    }
    
    func deleteMatch(match: MatchDTO) {
        
        let matchModel = match.toModel()
        
        if let objectToDelete = realm.object(ofType: MatchModel.self, forPrimaryKey: matchModel.id) {
            
            try? realm.write {
                realm.delete(objectToDelete)
            }
        }
    }
}
