//
//  Extensions.swift
//  CyberSpotApp
//
//  Created by Евгений on 11.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

extension MatchDTO {
    
    func toModel() -> MatchModel {
        
        let videogame = VideogameModel(id: self.videogame.id, name: self.videogame.name, slug: self.videogame.slug)
        let tournament = TournamentModel(beginAt: self.tournament.beginAt, endAt: self.tournament.endAt, id: self.tournament.id, leagueId: self.tournament.leagueId, name: self.tournament.name, prizepool: self.tournament.prizepool, serieId: self.tournament.serieId, slug: self.tournament.slug)
        let serie = SerieModel(beginAt: self.serie.beginAt, endAt: self.serie.endAt, fullName: self.serie.fullName, id: self.serie.id, leagueId: self.serie.leagueId, name: self.serie.name, season: self.serie.season, slug: self.serie.slug, year: self.serie.year)
        
        var results: [ResultModel] = []
        for result in self.results {
            
            let resultModel = ResultModel(score: result.score, teamId: result.teamId)
            results.append(resultModel)
        }
        
        var opponents: [OpponentModel] = []
        for opponent in self.opponents {
            
            let opponentTeam = TeamModel(acronym: opponent.opponent.acronym, id: opponent.opponent.id, imageUrl: opponent.opponent.imageUrl, location: opponent.opponent.location, name: opponent.opponent.name, slug: opponent.opponent.slug)
            let opponentModel = OpponentModel(opponent: opponentTeam, type: opponent.type)
            opponents.append(opponentModel)
        }
        
        let league = LeagueModel(id: self.league.id, imageUrl: self.league.imageUrl, name: self.league.name, slug: self.league.slug, url: self.league.url)
        
        var games: [GameModel] = []
        for game in self.games {
            
            let winnerModel = WinnerModel(id: game.winner.id, type: game.winner.type)
            let gameModel = GameModel(beginAt: game.beginAt, endAt: game.endAt, forfeit: game.forfeit, id: game.id, length: game.length, matchId: game.matchId, position: game.position, status: game.status, winner: winnerModel)
            games.append(gameModel)
        }
        
        let matchModel = MatchModel(beginAt: self.beginAt, endAt: self.endAt, forfeit: self.forfeit, games: games, id: self.id, league: league, matchType: self.matchType, name: self.name, numberOfGames: self.numberOfGames, opponents: opponents, originalScheduledAt: self.originalScheduledAt, rescheduled: self.rescheduled, results: results, scheduledAt: self.scheduledAt, serie: serie, slug: self.slug, status: self.status, tournament: tournament, videogame: videogame)
        
        return matchModel
    }
}

extension MatchModel {
    
    func toDto() -> MatchDTO {
        
        let videogame = VideogameDTO(id: self.videogame!.id, name: self.videogame!.name, slug: self.videogame!.slug)
        let tournament = TournamentDTO(beginAt: self.tournament!.beginAt, endAt: self.tournament!.endAt, id: self.tournament!.id, leagueId: self.tournament!.leagueId, name: self.tournament!.name, slug: self.tournament!.slug, prizepool: self.tournament!.prizepool, serieId: self.tournament!.serieId)
        let serie = SerieDTO(beginAt: self.serie!.beginAt, endAt: self.serie!.endAt, fullName: self.serie!.fullName, id: self.serie!.id, leagueId: self.serie!.leagueId, name: self.serie!.name, season: self.serie!.season, slug: self.serie!.slug, year: self.serie!.year)
        
        var results: [ResultDTO] = []
        for result in self.results {
            
            let resultModel = ResultDTO(score: result.score, teamId: result.teamId)
            results.append(resultModel)
        }
        
        var opponents: [OpponentDTO] = []
        for opponent in self.opponents {
            
            let opponentTeam = TeamDTO(acronym: opponent.opponent!.acronym, id: opponent.opponent!.id, imageUrl: opponent.opponent!.imageUrl, location: opponent.opponent!.location, name: opponent.opponent!.name, slug: opponent.opponent!.slug)
            let opponentModel = OpponentDTO(opponent: opponentTeam, type: opponent.type)
            opponents.append(opponentModel)
        }
        
        let league = LeagueDTO(id: self.league!.id, imageUrl: self.league!.imageUrl, name: self.league!.name, slug: self.league!.slug, url: self.league!.url)
        
        var games: [GameDTO] = []
        for game in self.games {
            
            let winnerModel = WinnerDTO(id: game.winner!.id, type: game.winner!.type)
            let gameModel = GameDTO(beginAt: game.beginAt, endAt: game.endAt, forfeit: game.forfeit, id: game.id, length: game.length, matchId: game.matchId, position: game.position, status: game.status, winner: winnerModel)
            games.append(gameModel)
        }
        
        let matchDTO = MatchDTO(beginAt: self.beginAt, endAt: self.endAt, forfeit: self.forfeit, games: games, id: self.id, league: league, matchType: self.matchType, name: self.name, numberOfGames: self.numberOfGames, opponents: opponents, originalScheduledAt: self.originalScheduledAt, rescheduled: self.rescheduled, results: results, scheduledAt: self.scheduledAt, serie: serie, slug: self.slug, status: self.status, tournament: tournament, videogame: videogame)
        
        return matchDTO
    }
}

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: UIScreen.main.bounds)
        spinnerView.backgroundColor = UIColor.white
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.color = UIColor.black
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
