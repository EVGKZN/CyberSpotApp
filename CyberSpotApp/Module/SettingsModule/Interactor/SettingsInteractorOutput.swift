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
    
    func didFinishGettingCurrentDota2ButtonStateImage(with image: UIImage)
    func didFinishGettingCurrentCSGOButtonStateImage(with image: UIImage)
}
