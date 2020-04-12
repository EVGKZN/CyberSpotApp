//
//  MatchDTO.swift
//  CyberSpotApp
//
//  Created by Евгений on 12.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

struct MatchDTO {
    
    var beginAt:                String
    var endAt:                  String
    var forfeit:                Bool
    var games:                  [GameDTO]
    var id:                     Int64
    var league:                 LeagueDTO
    var matchType:              String
    var name:                   String
    var numberOfGames:          Int
    var opponents:              [OpponentDTO]
    var originalScheduledAt:    String
    var rescheduled:            Bool
    var results:                [ResultDTO]
    var scheduledAt:            String
    var serie:                  SerieDTO
    var slug:                   String
    var status:                 String
    var tournament:             TournamentDTO
    var videogame:              VideogameDTO
    
    init(beginAt:                String,
         endAt:                  String,
         forfeit:                Bool,
         games:                  [GameDTO],
         id:                     Int64,
         league:                 LeagueDTO,
         matchType:              String,
         name:                   String,
         numberOfGames:          Int,
         opponents:              [OpponentDTO],
         originalScheduledAt:    String,
         rescheduled:            Bool,
         results:                [ResultDTO],
         scheduledAt:            String,
         serie:                  SerieDTO,
         slug:                   String,
         status:                 String,
         tournament:             TournamentDTO,
         videogame:              VideogameDTO) {
        
        self.beginAt = beginAt
        self.endAt = endAt
        self.forfeit = forfeit
        self.games = games
        self.id = id
        self.league = league
        self.matchType = matchType
        self.name = name
        self.numberOfGames = numberOfGames
        self.opponents = opponents
        self.originalScheduledAt = originalScheduledAt
        self.rescheduled = rescheduled
        self.scheduledAt = scheduledAt
        self.serie = serie
        self.slug = slug
        self.status = status
        self.tournament = tournament
        self.videogame = videogame
        self.results = results
    }
}

struct GameDTO {
    
    var beginAt:                String
    var endAt:                  String
    var forfeit:                Bool
    var id:                     Int64
    var length:                 Int64
    var matchId:                Int64
    var position:               Int
    var status:                 String
    var winner:                 WinnerDTO
    
    init(   beginAt:                String,
            endAt:                  String,
            forfeit:                Bool,
            id:                     Int64,
            length:                 Int64,
            matchId:                Int64,
            position:               Int,
            status:                 String,
            winner:                 WinnerDTO) {
        
        self.beginAt = beginAt
        self.endAt = endAt
        self.forfeit = forfeit
        self.id = id
        self.length = length
        self.matchId = matchId
        self.position = position
        self.status = status
        self.winner = winner
    }
}

struct LeagueDTO {
    
    var id:                     Int64
    var imageUrl:               String
    var name:                   String
    var slug:                   String
    var url:                    String
    
    init(   id:                     Int64,
            imageUrl:               String,
            name:                   String,
            slug:                   String,
            url:                    String) {
            
        self.id = id
        self.imageUrl = imageUrl
        self.name = name
        self.slug = slug
        self.url = url
    }
}

struct OpponentDTO {
    
    var opponent:               TeamDTO
    var type:                   String
    
    init(   opponent:               TeamDTO,
            type:                   String) {
            
        self.opponent = opponent
        self.type = type
    }
}

struct ResultDTO {
    
    var score:                  Int
    var teamId:                 Int64
    
    init(   score:                  Int,
            teamId:                 Int64) {
            
        self.score = score
        self.teamId = teamId
    }
}

struct SerieDTO {
    
    var beginAt:                String
    var endAt:                  String
    var fullName:               String
    var id:                     Int64
    var leagueId:               Int64
    var name:                   String
    var season:                 String
    var slug:                   String
    var year:                   Int
    
    init(   beginAt:                String,
            endAt:                  String,
            fullName:               String,
            id:                     Int64,
            leagueId:               Int64,
            name:                   String,
            season:                 String,
            slug:                   String,
            year:                   Int) {
        
        self.beginAt = beginAt
        self.endAt = endAt
        self.fullName = fullName
        self.id = id
        self.leagueId = leagueId
        self.name = name
        self.season = season
        self.slug = slug
        self.year = year
    }
}

struct TournamentDTO {
    
    var beginAt:                String
    var endAt:                  String
    var id:                     Int64
    var leagueId:               Int64
    var name:                   String
    var prizepool:              String
    var serieId:                Int64
    var slug:                   String
    
    init(   beginAt:                String,
            endAt:                  String,
            id:                     Int64,
            leagueId:               Int64,
            name:                   String,
            slug:                   String,
            prizepool:              String,
            serieId:                Int64) {
        
        self.beginAt = beginAt
        self.endAt = endAt
        self.id = id
        self.leagueId = leagueId
        self.name = name
        self.slug = slug
        self.prizepool = prizepool
        self.serieId = serieId
    }
}

struct VideogameDTO {
    
    var id:                     Int64
    var name:                   String
    var slug:                   String
    
    init(   id:                     Int64,
            name:                   String,
            slug:                   String) {
        
        self.id = id
        self.name = name
        self.slug = slug
    }
}

struct TeamDTO {
    
    var acronym:                String
    var id:                     Int64
    var imageUrl:               String
    var location:               String
    var name:                   String
    var slug:                   String
    
    init(   acronym:                String,
            id:                     Int64,
            imageUrl:               String,
            location:               String,
            name:                   String,
            slug:                   String) {
        
        self.acronym = acronym
        self.id = id
        self.imageUrl = imageUrl
        self.location = location
        self.name = name
        self.slug = slug
    }
}

struct WinnerDTO {
    
    var id:                     Int64
    var type:                   String
    
    init(   id:                     Int64,
            type:                   String) {
        
        self.id = id
        self.type = type
    }
}
