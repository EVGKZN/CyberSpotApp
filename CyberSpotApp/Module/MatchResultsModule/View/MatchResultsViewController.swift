//
//  MatchResultsViewController.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class MatchResultsViewController: UIViewController, MatchResultsViewInput, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var noInternetConnectionView: UIView!
    @IBOutlet weak var matchResultsTableView: UITableView!
    
    var presenter: MatchResultsViewOutput!
    var matches: [MatchDTO] = []
    var refreshControl: UIRefreshControl?
    
    private var isLoadingMoreMatches = true
    private var isRefreshing = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        matchResultsTableView.delegate = self
        matchResultsTableView.dataSource = self
        matchResultsTableView.register(UINib(nibName: Constants.customMatchCellNibName, bundle: nil), forCellReuseIdentifier: Constants.customMatchCellReuseIdentifier)
        matchResultsTableView.estimatedRowHeight = CGFloat(Constants.preferredHeight)
        
        addRefreshControl()
        addObservers()
        
        presenter.initDefaultConfiguration()
        presenter.isConnectedToNetwork()
        presenter.loadMatches()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.checkIfUserNew()
    }
    
    func didFinishMatchesLoading(matches: [MatchDTO]) {
        
        if matches.isEmpty {
            showEmptyFilterErrorAlertController()
            return
        }
        
        if isRefreshing {
            self.matches = matches
            isRefreshing = false
            DispatchQueue.main.async {
                self.refreshControl?.endRefreshing()
            }
        } else {
            self.matches.append(contentsOf: matches)
        }
        
        DispatchQueue.main.async {
            self.isLoadingMoreMatches = false
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height {
          if !isLoadingMoreMatches {
            isLoadingMoreMatches = true
            presenter.loadMatches()
          }
        }
    }
    
    func addRefreshControl() {
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        matchResultsTableView.addSubview(refreshControl!)
    }
    
    @objc func refreshTable() {
        
        isRefreshing = true
        presenter.refreshMatches()
        matchResultsTableView.setContentOffset(.zero, animated: true)
    }
    
    func didFinishCheckingInternetConnection(result: Bool) {
        
        if result {
            noInternetConnectionView.isHidden = true
        } else {
            matchResultsTableView.isHidden = true
        }
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTable), name: Notification.Name(rawValue: Constants.updateMatchesViewNotificationName), object: nil)
    }
    
    func showEmptyFilterErrorAlertController() {
        
        let alertController = UIAlertController(title: Constants.emptyFilterAlertControllerTitle, message: Constants.emptyFilterAlertControllerMessage, preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: Constants.emptyFilterOkActionTitle, style: .default) {
            UIAlertAction in
            
            if self.isRefreshing {
                self.isRefreshing = false
                DispatchQueue.main.async {
                    self.refreshControl?.endRefreshing()
                }
            }
        }
        alertController.addAction(alertOkAction)
        present(alertController, animated: true)
    }
}
