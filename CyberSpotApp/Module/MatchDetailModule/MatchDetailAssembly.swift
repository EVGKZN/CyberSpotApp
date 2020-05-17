//
//  MatchDetailAssembly.swift
//  CyberSpotApp
//
//  Created by Евгений on 16.05.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import UIKit

class MatchDetailAssembly: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let view = viewController as? MatchDetailViewController else { return }
        
        let presenter = MatchDetailPresenter()
        let interactor = MatchDetailInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        
        interactor.presenter = presenter
    }
}
