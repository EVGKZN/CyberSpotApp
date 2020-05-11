//
//  MatchModel.swift
//  CyberSpotApp
//
//  Created by Евгений on 11.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class MatchModel: Object {
    
    dynamic var beginAt = String()
    dynamic var endAt = String()
    dynamic var forfeit = Bool()
    var games = List<GameModel>()
    dynamic var id = Int64()
    dynamic var league: LeagueModel? = nil
    dynamic var matchType = String()
    dynamic var name = String()
    dynamic var numberOfGames = Int()
    var opponents = List<OpponentModel>()
    dynamic var originalScheduledAt = String()
    dynamic var rescheduled = Bool()
    var results = List<ResultModel>()
    dynamic var scheduledAt = String()
    dynamic var serie: SerieModel? = nil
    dynamic var slug = String()
    dynamic var status = String()
    dynamic var tournament: TournamentModel? = nil
    dynamic var videogame: VideogameModel? = nil
    
    override class func primaryKey() -> String? {
        return #keyPath(MatchModel.id)
    }
    
    convenience init(beginAt: String, endAt: String, forfeit: Bool, games: [GameModel], id: Int64, league: LeagueModel, matchType: String, name: String, numberOfGames: Int, opponents: [OpponentModel], originalScheduledAt: String, rescheduled: Bool, results: [ResultModel], scheduledAt: String, serie: SerieModel, slug: String, status: String, tournament: TournamentModel, videogame: VideogameModel) {
        self.init()
        
        self.beginAt = beginAt
        self.endAt = endAt
        self.forfeit = forfeit
        self.games.append(objectsIn: games)
        self.id = id
        self.league = league
        self.matchType = matchType
        self.name = name
        self.numberOfGames = numberOfGames
        self.opponents.append(objectsIn: opponents)
        self.originalScheduledAt = originalScheduledAt
        self.rescheduled = rescheduled
        self.results.append(objectsIn: results)
        self.scheduledAt = scheduledAt
        self.serie = serie
        self.slug = slug
        self.status = status
        self.tournament = tournament
        self.videogame = videogame
    }
}

@objcMembers
class GameModel: Object {
    
    dynamic var beginAt = String()
    dynamic var endAt = String()
    dynamic var forfeit = Bool()
    dynamic var id = Int64()
    dynamic var length = Int64()
    dynamic var matchId = Int64()
    dynamic var position = Int()
    dynamic var status = String()
    dynamic var winner: WinnerModel? = nil
    
    convenience init(beginAt: String, endAt: String, forfeit: Bool, id: Int64, length: Int64, matchId : Int64, position: Int, status: String, winner: WinnerModel) {
        self.init()
        
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

@objcMembers
class WinnerModel: Object {
    
    dynamic var id = Int64()
    dynamic var type = String()
    
    convenience init(id: Int64, type: String) {
        self.init()
        
        self.id = id
        self.type = type
    }
}

@objcMembers
class LeagueModel: Object {
    
    dynamic var id = Int64()
    dynamic var imageUrl = String()
    dynamic var name = String()
    dynamic var slug = String()
    dynamic var url = String()
    
    convenience init(id: Int64, imageUrl: String, name: String, slug: String, url: String) {
        self.init()
        
        self.id = id
        self.imageUrl = imageUrl
        self.name = name
        self.slug = slug
        self.url = url
    }
}

@objcMembers
class OpponentModel: Object {
    
    dynamic var opponent: TeamModel? = nil
    dynamic var type = String()
    
    convenience init(opponent: TeamModel, type: String) {
        self.init()
        
        self.opponent = opponent
        self.type = type
    }
}

@objcMembers
class TeamModel: Object {
    
    dynamic var acronym = String()
    dynamic var id = Int64()
    dynamic var imageUrl = String()
    dynamic var location = String()
    dynamic var name = String()
    dynamic var slug = String()
    
    convenience init(acronym: String, id: Int64, imageUrl: String, location: String, name: String, slug: String) {
        self.init()
        
        self.acronym = acronym
        self.id = id
        self.imageUrl = imageUrl
        self.location = location
        self.name = name
        self.slug = slug
    }
}

@objcMembers
class ResultModel: Object {
    
    dynamic var score = Int()
    dynamic var teamId = Int64()
    
    convenience init(score: Int, teamId: Int64) {
        self.init()
        
        self.score = score
        self.teamId = teamId
    }
}

@objcMembers
class SerieModel: Object {
    
    dynamic var beginAt = String()
    dynamic var endAt = String()
    dynamic var fullName = String()
    dynamic var id = Int64()
    dynamic var leagueId = Int64()
    dynamic var name = String()
    dynamic var season = String()
    dynamic var slug = String()
    dynamic var year = Int()
    
    convenience init(beginAt: String, endAt: String, fullName: String, id: Int64, leagueId: Int64, name: String, season: String, slug: String, year: Int) {
        self.init()
        
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

@objcMembers
class TournamentModel: Object {
    
    dynamic var beginAt = String()
    dynamic var endAt = String()
    dynamic var id = Int64()
    dynamic var leagueId = Int64()
    dynamic var name = String()
    dynamic var prizepool = String()
    dynamic var serieId = Int64()
    dynamic var slug = String()
    
    convenience init(beginAt: String, endAt: String, id: Int64, leagueId: Int64, name: String, prizepool: String, serieId: Int64, slug: String) {
        self.init()
        
        self.beginAt = beginAt
        self.endAt = endAt
        self.id = id
        self.leagueId = leagueId
        self.name = name
        self.prizepool = prizepool
        self.serieId = serieId
        self.slug = slug
    }
}

@objcMembers
class VideogameModel: Object {
    
    dynamic var id = Int64()
    dynamic var name = String()
    dynamic var slug = String()
    
    convenience init(id: Int64, name: String, slug: String) {
        self.init()
        
        self.id = id
        self.name = name
        self.slug = slug
    }
}
