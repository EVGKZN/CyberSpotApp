//
//  OnboardingRouter.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class OnboardingRouter: OnboardingRouterInput {
    
    weak var view: UIViewController!
    
    func dismissOnboarding() {
        view.dismiss(animated: true, completion: nil)
    }
}
