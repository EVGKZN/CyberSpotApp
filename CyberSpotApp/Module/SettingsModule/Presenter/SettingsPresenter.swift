//
//  SettingsPresenter.swift
//  CyberSpotApp
//
//  Created by Евгений on 19.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class SettingsPresenter: SettingsViewOutput, SettingsInteractorOutput {
    
    weak var view: SettingsViewInput!
    var interactor: SettingsInteractorInput!
    
    func getCurrentDota2ButtonStateImage() {
        interactor.getCurrentDota2ButtonStateImage()
    }
    
    func getCurrentCSGOButtonStateImage() {
        interactor.getCurrentCSGOButtonStateImage()
    }
    
    func didPressedDota2SettingsButton() {
        interactor.didPressedDota2SettingsButton()
    }
    
    func didPressedCSGOSettingsButton() {
        interactor.didPressedCSGOSettingsButton()
    }
    
    func didFinishGettingCurrentDota2ButtonStateImage(with image: UIImage) {
        view.didFinishGettingCurrentDota2ButtonStateImage(with: image)
    }
    
    func didFinishGettingCurrentCSGOButtonStateImage(with image: UIImage) {
        view.didFinishGettingCurrentCSGOButtonStateImage(with: image)
    }
}
