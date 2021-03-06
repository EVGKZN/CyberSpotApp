//
//  MatchDetailPresenter.swift
//  CyberSpotApp
//
//  Created by Евгений on 16.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class MatchDetailPresenter: MatchDetailViewOutput, MatchDetailInteractorOutput {
    
    weak var view: MatchDetailViewInput!
    var interactor: MatchDetailInteractorInput!
}
