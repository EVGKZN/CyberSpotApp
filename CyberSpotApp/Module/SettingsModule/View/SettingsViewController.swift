//
//  SettingsViewController.swift
//  CyberSpotApp
//
//  Created by Евгений on 19.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, SettingsViewInput {
    
    @IBOutlet weak var csgoButton: UIButton!
    @IBOutlet weak var dota2Button: UIButton!
    
    var presenter: SettingsViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getCurrentCSGOButtonStateImage()
        presenter.getCurrentDota2ButtonStateImage()
    }
    
    @IBAction func didPressedDota2Button(_ sender: Any) {
        
        presenter.didPressedDota2SettingsButton()
        presenter.getCurrentDota2ButtonStateImage()
        presenter.notifyToUpdateMatchesView()
    }
    
    @IBAction func didPressedCSGOButton(_ sender: Any) {
        
        presenter.didPressedCSGOSettingsButton()
        presenter.getCurrentCSGOButtonStateImage()
        presenter.notifyToUpdateMatchesView()
    }
    
    func didFinishGettingCurrentDota2ButtonStateImage(with image: UIImage) {
        self.dota2Button.setImage(image, for: .normal)
    }
    
    func didFinishGettingCurrentCSGOButtonStateImage(with image: UIImage) {
        self.csgoButton.setImage(image, for: .normal)
    }
}
