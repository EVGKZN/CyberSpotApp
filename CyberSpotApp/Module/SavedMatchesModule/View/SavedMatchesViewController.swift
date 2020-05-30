//
//  SavedMatchesViewController.swift
//  CyberSpotApp
//
//  Created by Евгений on 11.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class SavedMatchesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SavedMatchesViewInput {
    
    @IBOutlet weak var noItemsView: UIView!
    @IBOutlet weak var savedMatchesTableView: UITableView!
    
    private var matches: [MatchDTO] = []
    var presenter: SavedMatchesViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedMatchesTableView.delegate = self
        savedMatchesTableView.dataSource = self
        savedMatchesTableView.register(UINib(nibName: Constants.customSavedMatchesCellNibName, bundle: nil), forCellReuseIdentifier: Constants.customMatchCellReuseIdentifier)
        savedMatchesTableView.estimatedRowHeight = CGFloat(Constants.preferredHeight)
        savedMatchesTableView.tableFooterView = UIView()
        
        addObservers()
        
        presenter.loadMatches()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = savedMatchesTableView.dequeueReusableCell(withIdentifier: Constants.customMatchCellReuseIdentifier) as! SavedMatchesTableViewCell
        cell.configure(with: matches[indexPath.row], presenterDelegate: presenter)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        savedMatchesTableView.deselectRow(at: indexPath, animated: true)
        presenter.didPressCell(with: matches[indexPath.row])
    }
    
    func didFinishLoadingMatches(matches: [MatchDTO]) {
        
        self.matches = matches
        DispatchQueue.main.async {
            if matches.isEmpty {
                
                self.savedMatchesTableView.isHidden = true
                self.noItemsView.isHidden = false
            } else {
                
                self.savedMatchesTableView.isHidden = false
                self.noItemsView.isHidden = true
                self.savedMatchesTableView.reloadData()
            }
        }
    }
    
    func didFinishDeletingMatch() {
        presenter.loadMatches()
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTable), name: Notification.Name(rawValue: Constants.updateSavedMatchesViewNotificationName), object: nil)
    }
    
    @objc func refreshTable() {
        presenter.loadMatches()
    }
}
