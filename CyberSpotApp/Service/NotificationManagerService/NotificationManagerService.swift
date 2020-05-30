//
//  NotificationManagerService.swift
//  CyberSpotApp
//
//  Created by Евгений on 24.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol NotificationManagerService {
    
    /// Function for notifying matches view to update
    func notifyToUpdateMatchesView()
    
    /// Function for notifying saved matches view to update
    func notifyToUpdateSavedMatchesView()
}
