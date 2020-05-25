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
    
    func saveMatch(match: MatchDTO, completion: @escaping (Bool) -> Void) {
        
        var isSaved = false
        DispatchQueue.global(qos: .utility).async {
            
            let realm = try! Realm(configuration: .defaultConfiguration)
            if realm.object(ofType: MatchModel.self, forPrimaryKey: match.id) == nil {
                
                let matchModel = match.toModel()
                try! realm.write {
                    realm.add(matchModel)
                }
                isSaved = true
                completion(isSaved)
            }
        }
    }
    
    func getMatches() -> [MatchDTO] {
        
        let realm = try! Realm(configuration: .defaultConfiguration)
        let models = realm.objects(MatchModel.self)
        var matchesDTO: [MatchDTO] = []
        
        for model in models {
            matchesDTO.append(model.toDto())
        }
        
        return matchesDTO
    }
    
    func deleteMatch(match: MatchDTO, completion: @escaping () -> Void) {
        
        let matchModel = match.toModel()
        
        DispatchQueue.global(qos: .utility).async {
            
            let realm = try! Realm(configuration: .defaultConfiguration)
            if let objectToDelete = realm.object(ofType: MatchModel.self, forPrimaryKey: matchModel.id) {
                
                try? realm.write {
                    realm.delete(objectToDelete)
                }
                completion()
            }
        }
    }
}
