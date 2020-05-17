//
//  SavedMatchesAssembly.swift
//  CyberSpotApp
//
//  Created by Евгений on 11.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class SavedMatchesAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? SavedMatchesViewController else { return }
        
        let presenter = SavedMatchesPresenter()
        let interactor = SavedMatchesInteractor()
        let router = SavedMatchesRouter()
        let databaseManager = RealmDatabaseManagerServiceImpl()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.databaseManager = databaseManager
        
        router.view = view
    }
}
