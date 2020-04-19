//
//  SettingsConfigurationServiceImpl.swift
//  CyberSpotApp
//
//  Created by Евгений on 19.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class SettingsConfigurationServiceImpl: SettingsConfigurationService {
    
    private let UD = UserDefaults.standard
    
    func getCurrentCSGOButtonStateImage() -> UIImage {
        
        guard let videogamesIdArray = UD.array(forKey: Constants.userDefaultsVideogamesIdArrayKey) as? [Int] else { return UIImage() }
        
        let image = videogamesIdArray.contains(Constants.defaultCSGOVideogameId) == true ? UIImage(named: Constants.csgoOnIconImage) : UIImage(named: Constants.csgoOffIconImage)
        guard let checkedImage = image else {
            return UIImage()
        }
        return checkedImage
    }
    
    func getCurrentDota2ButtonStateImage() -> UIImage {
        
        guard let videogamesIdArray = UD.array(forKey: Constants.userDefaultsVideogamesIdArrayKey) as? [Int] else { return UIImage() }
        
        let image = videogamesIdArray.contains(Constants.defaultDota2VideogameId) == true ? UIImage(named: Constants.dota2OnIconImage) : UIImage(named: Constants.dota2OffIconImage)
        guard let checkedImage = image else {
            return UIImage()
        }
        return checkedImage
    }
    
    func initDefaultConfiguration() {
        if UD.array(forKey: Constants.userDefaultsVideogamesIdArrayKey) == nil {
            UD.set(Constants.defaultVideogamesIdArray, forKey: Constants.userDefaultsVideogamesIdArrayKey)
        }
    }
    
    func didPressedCSGOSettingsButton() {
        
        guard var videogamesIdArray = UD.array(forKey: Constants.userDefaultsVideogamesIdArrayKey) as? [Int] else { return }
        
        if videogamesIdArray.contains(Constants.defaultCSGOVideogameId) {
            
            videogamesIdArray.remove(at: videogamesIdArray.firstIndex(of: Constants.defaultCSGOVideogameId)!)
            UD.set(videogamesIdArray, forKey: Constants.userDefaultsVideogamesIdArrayKey)
        } else {
            
            videogamesIdArray.append(Constants.defaultCSGOVideogameId)
            UD.set(videogamesIdArray, forKey: Constants.userDefaultsVideogamesIdArrayKey)
        }
    }
    
    func didPressedDota2SettingsButton() {
        
        guard var videogamesIdArray = UD.array(forKey: Constants.userDefaultsVideogamesIdArrayKey) as? [Int] else { return }
        
        if videogamesIdArray.contains(Constants.defaultDota2VideogameId) {
            
            videogamesIdArray.remove(at: videogamesIdArray.firstIndex(of: Constants.defaultDota2VideogameId)!)
            UD.set(videogamesIdArray, forKey: Constants.userDefaultsVideogamesIdArrayKey)
        } else {
            
            videogamesIdArray.append(Constants.defaultDota2VideogameId)
            UD.set(videogamesIdArray, forKey: Constants.userDefaultsVideogamesIdArrayKey)
        }
    }
}
