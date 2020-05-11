//
//  NotificationManagerService.swift
//  CyberSpotApp
//
//  Created by Евгений on 24.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol NotificationManagerService {
    
    func notifyToUpdateMatchesView()
    func notifyToUpdateSavedMatchesView()
}
