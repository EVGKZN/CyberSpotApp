//
//  MatchResultsRouter.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class MatchResultsRouter: MatchResultsRouterInput {
    
    weak var view: UIViewController!
    
    func presentOnboarding() {
        
        let vc = view.storyboard?.instantiateViewController(withIdentifier: Constants.onboardingViewControllerName) as! OnboardingViewController
        vc.modalPresentationStyle = .fullScreen
        view.present(vc, animated: true, completion: nil)
    }
    
    func presentDetailView(for match: MatchDTO) {
        
        let vc = view.storyboard?.instantiateViewController(withIdentifier: Constants.detailViewControllerName) as! DetailViewConfigureProtocol
        vc.configure(with: match)
        view.present(vc as! UIViewController, animated: true, completion: nil)
    }
    
}
