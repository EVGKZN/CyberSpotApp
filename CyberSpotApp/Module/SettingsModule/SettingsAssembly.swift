//
//  SettingsAssembly.swift
//  CyberSpotApp
//
//  Created by Евгений on 19.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class SettingsAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? SettingsViewController else { return }
        
        let presenter = SettingsPresenter()
        let interactor = SettingsInteractor()
        let settingsConfigurationService = SettingsConfigurationServiceImpl()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.settingsConfigurationService = settingsConfigurationService
    }
}
