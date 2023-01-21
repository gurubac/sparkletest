//
//  sparkletestApp.swift
//  sparkletest
//
//  Created by guru on 1/20/23.
//

import SwiftUI

@main
struct sparkletestApp: App {
    @StateObject var updaterViewModel = UpdaterViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(after: .appInfo) {
                CheckForUpdatesView(updaterViewModel: updaterViewModel)
            }
        }
    }
}
