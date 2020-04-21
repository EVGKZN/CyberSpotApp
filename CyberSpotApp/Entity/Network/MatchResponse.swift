//
//  MatchResponse.swift
//  CyberSpotApp
//
//  Created by Евгений on 05.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

struct Match: Codable {
    
    var beginAt:                String?
    var endAt:                  String?
    var forfeit:                Bool?
    var games:                  [Game]
    var id:                     Int64
    var league:                 League
    var matchType:              String?
    var name:                   String?
    var numberOfGames:          Int
    var opponents:              [Opponent]
    var originalScheduledAt:    String?
    var rescheduled:            Bool?
    var results:                [Result]
    var scheduledAt:            String?
    var serie:                  Serie
    var slug:                   String?
    var status:                 String?
    var tournament:             Tournament
    var videogame:              Videogame
}

struct Game: Codable {
    
    var beginAt:                String?
    var endAt:                  String?
    var forfeit:                Bool?
    var id:                     Int64
    var length:                 Int64?
    var matchId:                Int64
    var position:               Int
    var status:                 String?
    var winner:                 Winner
}

struct League: Codable {
    
    var id:                     Int64
    var imageUrl:               String?
    var name:                   String?
    var slug:                   String?
    var url:                    String?
}

struct Opponent: Codable {
    
    var opponent:               Team
    var type:                   String?
}

struct Result: Codable {
    
    var score:                  Int
    var teamId:                 Int64
}

struct Serie: Codable {
    
    var beginAt:                String?
    var endAt:                  String?
    var fullName:               String?
    var id:                     Int64
    var leagueId:               Int64
    var name:                   String?
    var season:                 String?
    var slug:                   String?
    var year:                   Int
}

struct Tournament: Codable {
    
    var beginAt:                String?
    var endAt:                  String?
    var id:                     Int64
    var leagueId:               Int64
    var name:                   String?
    var prizepool:              String?
    var serieId:                Int64
    var slug:                   String?
}

struct Videogame: Codable {
    
    var id:                     Int64
    var name:                   String?
    var slug:                   String?
}

struct Team: Codable {
    
    var acronym:                String?
    var id:                     Int64
    var imageUrl:               String?
    var location:               String?
    var name:                   String?
    var slug:                   String?
}

struct Winner: Codable {
    
    var id:                     Int64
    var type:                   String?
}
