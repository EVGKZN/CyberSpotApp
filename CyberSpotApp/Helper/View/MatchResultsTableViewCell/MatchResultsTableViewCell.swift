//
//  MatchTableViewCell.swift
//  CyberSpotApp
//
//  Created by Евгений on 13.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit
import SDWebImage

class MatchResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var videogameImageImageView: UIImageView!
    @IBOutlet weak var videogameNameLabel: UILabel!
    @IBOutlet weak var firstOpponentImageImageView: UIImageView!
    @IBOutlet weak var secondOpponentImageImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var firstOpponentNameLabel: UILabel!
    @IBOutlet weak var secondOpponentNameLabel: UILabel!
    
    private var presenterDelegate: MatchResultsViewOutput!
    private var match: MatchDTO!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func didPressLikeMatchButton(_ sender: Any) {
        presenterDelegate.saveMatch(match: match)
    }
    
    func configure(with match: MatchDTO, presenterDelegate: MatchResultsViewOutput) {
        
        self.match = match
        self.presenterDelegate = presenterDelegate
        
        videogameImageImageView.image = match.videogame.name == Constants.dota2Name ? UIImage(named: Constants.dota2ImageName) : UIImage(named: Constants.csgoImageName)
        videogameNameLabel.text = match.videogame.name == Constants.dota2Name ? Constants.dota2Name.uppercased() : Constants.csgoName
            
        firstOpponentImageImageView.sd_setImage(with: URL(string: match.opponents[Constants.firstOpponentNumber].opponent.imageUrl), placeholderImage: UIImage(named: Constants.placeholderImageName))
        firstOpponentNameLabel.text = match.opponents[Constants.firstOpponentNumber].opponent.name
        secondOpponentImageImageView.sd_setImage(with: URL(string: match.opponents[Constants.secondOpponentNumber].opponent.imageUrl), placeholderImage: UIImage(named: Constants.placeholderImageName))
        secondOpponentNameLabel.text = match.opponents[Constants.secondOpponentNumber].opponent.name
        
        scoreLabel.text = "\(match.results[Constants.firstOpponentNumber].score) : \(match.results[Constants.secondOpponentNumber].score)"
        dateTimeLabel.text = match.scheduledAt
        leagueLabel.text = match.league.name
    }
}
