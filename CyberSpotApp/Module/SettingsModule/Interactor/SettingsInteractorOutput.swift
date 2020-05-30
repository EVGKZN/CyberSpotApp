//
//  SettingsInteractorOutput.swift
//  CyberSpotApp
//
//  Created by Евгений on 19.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsInteractorOutput: AnyObject {
    
    /// Function for checking current image of Dota2 button completion
    /// - Parameter image: Current image of Dota2 button
    func didFinishGettingCurrentDota2ButtonStateImage(with image: UIImage)
    
    /// Function for checking current image of CS:GO button completion
    /// - Parameter image: Current image of CS:GO button
    func didFinishGettingCurrentCSGOButtonStateImage(with image: UIImage)
}
