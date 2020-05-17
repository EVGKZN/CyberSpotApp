//
//  SavedMatchesRouter.swift
//  CyberSpotApp
//
//  Created by Евгений on 17.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class SavedMatchesRouter: SavedMatchesRouterInput {
    
    weak var view: UIViewController!
    
    func presentDetailView(for match: MatchDTO) {
        let vc = view.storyboard?.instantiateViewController(withIdentifier: Constants.detailViewControllerName) as! DetailViewConfigureProtocol
        vc.configure(with: match)
        view.present(vc as! UIViewController, animated: true, completion: nil)
    }
}
