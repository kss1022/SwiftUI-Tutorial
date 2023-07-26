//
//  NotificationController.swift
//  WatchChatper4 Watch App
//
//  Created by 한현규 on 2023/07/26.
//

import WatchKit
import UserNotifications
import SwiftUI



class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var landMark: LandMark?
    var title: String?
    var message: String?
    
    let landmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        NotificationView(
            title: title,
            message: message,
            landMark: landMark
        )
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()


        let notificationData =
            notification.request.content.userInfo as? [String: Any]


        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]


        title = alert?["title"] as? String
        message = alert?["body"] as? String


        if let index = notificationData?[landmarkIndexKey] as? Int {
            landMark = modelData.landMarks[index]
        }
    }
}
