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

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Need to delete this, only for testing process
        let networkManager = NetworkManagerServiceImpl()
        networkManager.getMacthes()    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.checkIfUserNew()
    }
}
