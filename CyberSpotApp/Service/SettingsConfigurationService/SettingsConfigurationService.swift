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
    
    func initDefaultConfiguration()
    func getCurrentDota2ButtonStateImage() -> UIImage
    func getCurrentCSGOButtonStateImage() -> UIImage
    func didPressedDota2SettingsButton()
    func didPressedCSGOSettingsButton()
}
