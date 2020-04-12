//
//  MatchResultsViewController.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class MatchResultsViewController: UIViewController, MatchResultsViewInput {
    
    var presenter: MatchResultsViewOutput!
    var matches: [MatchDTO] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.loadMatches()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.checkIfUserNew()
    }
    
    func didFinishMatchesLoading(matches: [MatchDTO]) {
        self.matches = matches
    }
}
