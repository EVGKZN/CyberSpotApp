//
//  ReponseToDTOConverterServiceImpl.swift
//  CyberSpotApp
//
//  Created by Евгений on 12.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class ReponseToDTOConverterServiceImpl: ReponseToDTOConverterService {
    
    let iso8601DateFormatter: DateFormatter!
    let customDateFormatter: DateFormatter!
    
    init() {
        
        iso8601DateFormatter = DateFormatter()
        iso8601DateFormatter.locale = Locale(identifier: Constants.localeIdentifier)
        iso8601DateFormatter.dateFormat = Constants.iso8601DateFormat

        customDateFormatter = DateFormatter()
        customDateFormatter.locale = Locale(identifier: Constants.localeIdentifier)
        customDateFormatter.dateFormat = Constants.customDateFormat
    }
    
    func convertToDTO(matches: [Match]) -> [MatchDTO] {
        
        var matchesDTO: [MatchDTO] = []
        
        for match in matches {
            
            let beginAt = formatStringDate(stringDate: match.beginAt)
            let endAt = formatStringDate(stringDate: match.endAt)
            let forfeit = match.forfeit ?? false
            let games = formatGames(games: match.games)
            let league = formatLeague(league: match.league)
            let matchType = match.matchType ?? Constants.undefinedStatus
            let name = match.name ?? Constants.undefinedStatus
            let opponents = formatOpponents(opponents: match.opponents)
            let originalScheduledAt = formatStringDate(stringDate: match.originalScheduledAt)
            let rescheduled = match.rescheduled ?? false
            let results = formatResults(results: match.results)
            let scheduledAt = formatStringDate(stringDate: match.scheduledAt)
            let serie = formatSerie(serie: match.serie)
            let slug = match.slug ?? Constants.undefinedStatus
            let status = match.status ?? Constants.undefinedStatus
            let tournament = formatTournament(tournament: match.tournament)
            let videogame = formatVideogame(videogame: match.videogame)
            
            matchesDTO.append(MatchDTO(beginAt: beginAt, endAt: endAt, forfeit: forfeit, games: games, id: match.id, league: league, matchType: matchType, name: name, numberOfGames: match.numberOfGames, opponents: opponents, originalScheduledAt: originalScheduledAt, rescheduled: rescheduled, results: results, scheduledAt: scheduledAt, serie: serie, slug: slug, status: status, tournament: tournament, videogame: videogame))
        }
        
        return matchesDTO
    }
    
    private func formatStringDate(stringDate: String?) -> String {
    
        guard let stringDate = stringDate else { return Constants.undefinedStatus }
        
        guard let date = iso8601DateFormatter.date(from: stringDate) else { return Constants.undefinedStatus }
        
        return customDateFormatter.string(from: date)
        
    }
    
    private func formatGames(games: [Game]) -> [GameDTO] {
        
        var gamesDTO: [GameDTO] = []
        
        for game in games {
            
            let beginAt = formatStringDate(stringDate: game.beginAt)
            let endAt = formatStringDate(stringDate: game.endAt)
            let forfeit = game.forfeit ?? false
            let status = game.status ?? Constants.undefinedStatus
            let winner = formatWinner(winner: game.winner)
            let length = game.length ??  Int64(Constants.undefinedInt)
            
            gamesDTO.append(GameDTO(beginAt: beginAt, endAt: endAt, forfeit: forfeit, id: game.id, length: length, matchId: game.matchId, position: game.position, status: status, winner: winner))
        }
        
        return gamesDTO
    }
    
    private func formatWinner(winner: Winner) -> WinnerDTO {
        
        let type = winner.type ?? Constants.undefinedStatus
        
        return WinnerDTO(id: winner.id, type: type)
    }
    
    private func formatLeague(league: League) -> LeagueDTO {
        
        let imageUrl = league.imageUrl ?? Constants.emptyString
        let name = league.name ?? Constants.undefinedStatus
        let slug = league.slug ?? Constants.undefinedStatus
        let url = league.url ?? Constants.emptyString
        
        return LeagueDTO(id: league.id, imageUrl: imageUrl, name: name, slug: slug, url: url)
    }
    
    private func formatOpponents(opponents: [Opponent]) -> [OpponentDTO] {
        
        var opponentsDTO: [OpponentDTO] = []
        
        for opponent in opponents {
            
            let opponentDTO = formatTeam(team: opponent.opponent)
            let type = opponent.type ?? Constants.undefinedStatus
            
            opponentsDTO.append(OpponentDTO(opponent: opponentDTO, type: type))
        }
        
        return opponentsDTO
    }
    
    private func formatTeam(team: Team) -> TeamDTO {
        
        let acronym = team.acronym ?? Constants.undefinedStatus
        let imageUrl = team.imageUrl ?? Constants.emptyString
        let location = team.location ?? Constants.undefinedStatus
        let name = team.name ?? Constants.undefinedStatus
        let slug = team.slug ?? Constants.undefinedStatus
        
        return TeamDTO(acronym: acronym, id: team.id, imageUrl: imageUrl, location: location, name: name, slug: slug)
    }
    
    private func formatResults(results: [Result]) -> [ResultDTO] {
        
        var resultsDTO: [ResultDTO] = []
        
        for result in results {
            resultsDTO.append(ResultDTO(score: result.score, teamId: result.teamId))
        }
        
        return resultsDTO
    }
    
    private func formatSerie(serie: Serie) -> SerieDTO {
        
        let beginAt = formatStringDate(stringDate: serie.beginAt)
        let endAt = formatStringDate(stringDate: serie.endAt)
        let fullName = serie.fullName ?? Constants.undefinedStatus
        let name = serie.name ?? Constants.undefinedStatus
        let season = serie.season ?? Constants.undefinedStatus
        let slug = serie.slug ?? Constants.undefinedStatus
        
        return SerieDTO(beginAt: beginAt, endAt: endAt, fullName: fullName, id: serie.id, leagueId: serie.leagueId, name: name, season: season, slug: slug, year: serie.year)
    }
    
    private func formatTournament(tournament: Tournament) -> TournamentDTO {
        
        let beginAt = formatStringDate(stringDate: tournament.beginAt)
        let endAt = formatStringDate(stringDate: tournament.endAt)
        let name = tournament.name ?? Constants.undefinedStatus
        let prizepool = tournament.prizepool ?? Constants.undefinedStatus
        let slug = tournament.slug ?? Constants.undefinedStatus
        
        return TournamentDTO(beginAt: beginAt, endAt: endAt, id: tournament.id, leagueId: tournament.leagueId, name: name, slug: slug, prizepool: prizepool, serieId: tournament.serieId)
    }
    
    private func formatVideogame(videogame: Videogame) -> VideogameDTO {
        
        let name = videogame.name ?? Constants.undefinedStatus
        let slug = videogame.slug ?? Constants.undefinedStatus
        
        return VideogameDTO(id: videogame.id, name: name, slug: slug)
    }
}
