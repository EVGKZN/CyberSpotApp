//
//  SettingsConfigurationService.swift
//  CyberSpotApp
//
//  Created by Евгений on 19.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsConfigurationService {
    
    /// Function for initialization default app configuration
    func initDefaultConfiguration()
    
    /// Function to check current image of Dota2 button
    func getCurrentDota2ButtonStateImage() -> UIImage
    
    /// Function to check current image of CS:GO button
    func getCurrentCSGOButtonStateImage() -> UIImage
    
    /// Function for Dota2 button click processing
    func didPressedDota2SettingsButton()
    
    /// Function for CS:GO button click processing
    func didPressedCSGOSettingsButton()
}
