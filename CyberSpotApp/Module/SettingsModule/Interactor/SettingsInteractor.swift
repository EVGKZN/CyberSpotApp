//
//  SettingsInteractor.swift
//  CyberSpotApp
//
//  Created by Евгений on 19.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class SettingsInteractor: SettingsInteractorInput {
    
    weak var presenter: SettingsInteractorOutput!
    var settingsConfigurationService: SettingsConfigurationService! 
    
    func getCurrentDota2ButtonStateImage() {
        
        let image = settingsConfigurationService.getCurrentDota2ButtonStateImage()
        presenter.didFinishGettingCurrentDota2ButtonStateImage(with: image)
    }
    
    func getCurrentCSGOButtonStateImage() {
        
        let image = settingsConfigurationService.getCurrentCSGOButtonStateImage()
        presenter.didFinishGettingCurrentCSGOButtonStateImage(with: image)
    }
    
    func didPressedDota2SettingsButton() {
        settingsConfigurationService.didPressedDota2SettingsButton()
    }
    
    func didPressedCSGOSettingsButton() {
        settingsConfigurationService.didPressedCSGOSettingsButton()
    }
}
