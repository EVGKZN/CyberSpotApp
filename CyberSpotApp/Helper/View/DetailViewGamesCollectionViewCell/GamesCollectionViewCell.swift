//
//  GamesCollectionViewCell.swift
//  CyberSpotApp
//
//  Created by Евгений on 16.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class GamesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var gameNumberLabel: UILabel!
    @IBOutlet weak var winnerTeamImageView: UIImageView!
    @IBOutlet weak var winnerTeamNameLabel: UILabel!
    @IBOutlet weak var gameDurationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with game: GameDTO, imageURL: String, winnerTeamName: String) {
        
        self.gameNumberLabel.text = Constants.gameNumberTextForLabel + "\(game.position)"
        self.winnerTeamImageView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: Constants.placeholderImageName))
        self.winnerTeamNameLabel.text = Constants.gameWinnerTextForLabel + winnerTeamName
        self.gameDurationLabel.text = Constants.gameDurationTextForLabel + Double(game.length).asString(style: .positional)
    }
}
