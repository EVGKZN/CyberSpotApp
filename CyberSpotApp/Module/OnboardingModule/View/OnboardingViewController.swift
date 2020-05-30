//
//  OnboardingViewController.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, OnboardingViewInput {
    
    var presenter: OnboardingViewOutput!
    
    @IBAction func didPressCloseButton(_ sender: Any) {
        presenter.closeOnboardingView()
    }
}
