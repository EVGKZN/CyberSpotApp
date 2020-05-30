//
//  MatchDetailViewController.swift
//  CyberSpotApp
//
//  Created by Евгений on 16.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class MatchDetailViewController: UIViewController, MatchDetailViewInput, DetailViewConfigureProtocol, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var videogameImageView: UIImageView!
    @IBOutlet weak var videogameNameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var firstTeamImageView: UIImageView!
    @IBOutlet weak var firstTeamNameLabel: UILabel!
    @IBOutlet weak var secondTeamImageView: UIImageView!
    @IBOutlet weak var secondTeamNameLabel: UILabel!
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var stageNameLabel: UILabel!
    @IBOutlet weak var prizepoolLabel: UILabel!
    @IBOutlet weak var leagueURLButton: UIButton!
    @IBOutlet weak var leagueLinkStackView: UIStackView!
    @IBOutlet weak var gamesCollectionView: UICollectionView!
    @IBOutlet weak var firstTeamCountryLabel: UILabel!
    @IBOutlet weak var secondTeamCountryLabel: UILabel!
    
    var presenter: MatchDetailViewOutput!
    var match: MatchDTO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videogameImageView.image = match.videogame.name == Constants.dota2Name ? UIImage(named: Constants.dota2ImageName) : UIImage(named: Constants.csgoImageName)
        videogameNameLabel.text = match.videogame.name == Constants.dota2Name ? Constants.dota2Name.uppercased() : Constants.csgoName
        
        firstTeamImageView.sd_setImage(with: URL(string: match.opponents[Constants.firstOpponentNumber].opponent.imageUrl), placeholderImage: UIImage(named: Constants.placeholderImageName))
        firstTeamNameLabel.text = match.opponents[Constants.firstOpponentNumber].opponent.name
        firstTeamCountryLabel.text = match.opponents[Constants.firstOpponentNumber].opponent.location
        
        secondTeamImageView.sd_setImage(with: URL(string: match.opponents[Constants.secondOpponentNumber].opponent.imageUrl), placeholderImage: UIImage(named: Constants.placeholderImageName))
        secondTeamNameLabel.text = match.opponents[Constants.secondOpponentNumber].opponent.name
        secondTeamCountryLabel.text = match.opponents[Constants.secondOpponentNumber].opponent.location
        
        scoreLabel.text = "\(match.results[Constants.firstOpponentNumber].score) : \(match.results[Constants.secondOpponentNumber].score)"
        dateLabel.text = match.scheduledAt
        
        leagueNameLabel.text = match.league.name
        stageNameLabel.text = match.tournament.name
        prizepoolLabel.text = match.tournament.prizepool
        
        if match.league.url.isEmpty {
            leagueLinkStackView.isHidden = true
        }
        
        gamesCollectionView.delegate = self
        gamesCollectionView.dataSource = self
        gamesCollectionView.register(UINib(nibName: Constants.customDetailViewGameCollectionViewCellNibName, bundle: nil), forCellWithReuseIdentifier: Constants.customDetailViewGameCollectionViewCellReuseIdentifier)
    }
    
    func configure(with item: Any?) {
        
        guard let match = item as? MatchDTO else { return }
        self.match = match
    }
    
    @IBAction func didPressGoToLeagueWebsite(_ sender: Any) {
        
        if let url = URL(string: match.league.url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return match.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.customDetailViewGameCollectionViewCellReuseIdentifier, for: indexPath) as! GamesCollectionViewCell
        
        var url = Constants.emptyString
        var winnerTeamName = Constants.emptyString
        for opponent in match.opponents {
            if opponent.opponent.id == match.games[indexPath.row].winner.id {
                url = opponent.opponent.imageUrl
                winnerTeamName = opponent.opponent.name
            }
        }
        cell.configure(with: match.games[indexPath.row], imageURL: url, winnerTeamName: winnerTeamName)
        return cell
    }
}
