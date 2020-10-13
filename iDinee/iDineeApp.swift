//
//  iDineeApp.swift
//  iDinee
//
//  Created by Alan Santoso on 13/10/20.
//

import SwiftUI

@main
struct iDineeApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var order = Order()

    var body: some Scene {
        WindowGroup {
            AppView().environmentObject(order)
        }.onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .active:
                print("active")
            case .inactive:
                print("inactive")
            case .background:
                print("scene in background right now")
            @unknown default:
                print("something new bro")
            }
        }
    }
}
