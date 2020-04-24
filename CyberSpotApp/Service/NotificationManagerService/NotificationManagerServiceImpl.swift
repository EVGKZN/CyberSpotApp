//
//  NotificationManagerServiceImpl.swift
//  CyberSpotApp
//
//  Created by Евгений on 24.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

class NotificationManagerServiceImpl: NotificationManagerService {
    
    func notifyToUpdateMatchesView() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.updateMatchesViewNotificationName), object: nil)
    }
}
