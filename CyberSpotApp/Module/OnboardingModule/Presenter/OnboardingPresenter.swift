//
//  OnboardingPresenter.swift
//  CyberSpotApp
//
//  Created by Евгений on 04.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class OnboardingPresenter: OnboardingViewOutput, OnboardingInteractorOutput {
    
    weak var view: OnboardingViewInput!
    var interactor: OnboardingInteractorInput!
    var router: OnboardingRouterInput!
    
    func closeOnboardingView() {
        interactor.setUserIsNotNew()
        router.dismissOnboarding()
    }
}
