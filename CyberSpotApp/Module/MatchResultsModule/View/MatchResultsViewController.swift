//
//  MatchResultsViewController.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class MatchResultsViewController: UIViewController, MatchResultsViewInput, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var matchResultsTableView: UITableView!
    
    var presenter: MatchResultsViewOutput!
    var matches: [MatchDTO] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.initDefaultConfiguration()
        presenter.loadMatches()
        matchResultsTableView.delegate = self
        matchResultsTableView.dataSource = self
        matchResultsTableView.register(UINib(nibName: Constants.customMatchCellNibName, bundle: nil), forCellReuseIdentifier: Constants.customMatchCellReuseIdentifier)
        matchResultsTableView.estimatedRowHeight = CGFloat(Constants.preferredHeight)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.checkIfUserNew()
    }
    
    func didFinishMatchesLoading(matches: [MatchDTO]) {
        
        self.matches = matches
        DispatchQueue.main.async {
           self.matchResultsTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = matchResultsTableView.dequeueReusableCell(withIdentifier: Constants.customMatchCellReuseIdentifier) as! MatchTableViewCell
        cell.configure(with: matches[indexPath.row])
        return cell
    }
}
