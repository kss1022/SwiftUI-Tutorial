//
//  Chapter4App.swift
//  Chapter3
//
//  Created by 한현규 on 2023/07/19.
//

import SwiftUI

@main
struct Chapter4App: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        
        

#if os(watchOS)
WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
#endif
    }
}
