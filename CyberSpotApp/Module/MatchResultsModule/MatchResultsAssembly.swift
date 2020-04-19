//
//  MatchResultsAssembly.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class MatchResultsAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? MatchResultsViewController else { return }
        
        let presenter = MatchResultsPresenter()
        let interactor = MatchResultsInteractor()
        let router = MatchResultsRouter()
        let newUserService = NewUserServiceImpl()
        let networkManagerService = NetworkManagerServiceImpl()
        let reponseToDTOConverterService = ReponseToDTOConverterServiceImpl()
        let settingsConfigurationService = SettingsConfigurationServiceImpl()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        interactor.newUserService = newUserService
        interactor.networkManager = networkManagerService
        interactor.responseToDTOConverter = reponseToDTOConverterService
        interactor.settingsConfigurationService = settingsConfigurationService
        
        router.view = view
    }
}
