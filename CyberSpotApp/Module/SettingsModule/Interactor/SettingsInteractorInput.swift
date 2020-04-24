//
//  SettingsInteractorInput.swift
//  CyberSpotApp
//
//  Created by Евгений on 19.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsInteractorInput: AnyObject {
    
    func getCurrentDota2ButtonStateImage()
    func getCurrentCSGOButtonStateImage()
    func didPressedDota2SettingsButton()
    func didPressedCSGOSettingsButton()
    func notifyToUpdateMatchesView()
}
