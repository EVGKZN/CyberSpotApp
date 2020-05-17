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
    var reachibility: Reachability!
    
    private var isLoadingMoreMatches = true
    private var isRefreshing = false
    private var isInitiallizing = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showSpinner(onView: self.view)
        self.noInternetConnectionView.isHidden = true
        matchResultsTableView.delegate = self
        matchResultsTableView.dataSource = self
        matchResultsTableView.register(UINib(nibName: Constants.customMatchResultsCellNibName, bundle: nil), forCellReuseIdentifier: Constants.customMatchCellReuseIdentifier)
        matchResultsTableView.estimatedRowHeight = CGFloat(Constants.preferredHeight)
        matchResultsTableView.isHidden = true
        matchResultsTableView.tableFooterView = UIView()
        
        addRefreshControl()
        addObservers()
        
        presenter.initDefaultConfiguration()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.checkIfUserNew()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
        
        if isInitiallizing {
            
            self.removeSpinner()
            isInitiallizing = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = matchResultsTableView.dequeueReusableCell(withIdentifier: Constants.customMatchCellReuseIdentifier) as! MatchResultsTableViewCell
        cell.configure(with: matches[indexPath.row], presenterDelegate: presenter)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        matchResultsTableView.deselectRow(at: indexPath, animated: true)
        presenter.didPressCell(with: matches[indexPath.row])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if ((!isInitiallizing)&&(!isRefreshing)) {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            
            if offsetY > contentHeight - scrollView.frame.height - CGFloat(Constants.additiveSubtrahendForPredownloadingNewMatches) {
                if !isLoadingMoreMatches {
                    isLoadingMoreMatches = true
                    presenter.loadMatches()
                }
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
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTable), name: Notification.Name(rawValue: Constants.updateMatchesViewNotificationName), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged(_:)), name: Notification.Name.reachabilityChanged, object: nil)
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
    
    @objc func reachabilityChanged(_ note: NSNotification) {
        let reachability = note.object as! Reachability
        if reachability.connection != .unavailable {
            
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
            
            if !isInitiallizing{
                self.isInitiallizing = true
                self.showSpinner(onView: self.view)
            }
            refreshTable()
            noInternetConnectionView.isHidden = true
            matchResultsTableView.isHidden = false
        } else {
            
            print("Not reachable")
            
            matchResultsTableView.isHidden = true
            noInternetConnectionView.isHidden = false
            if isInitiallizing {
                
                self.removeSpinner()
                isInitiallizing = false
            }
        }
    }
}
