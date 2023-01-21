//
//  checkForUpdatesView.swift
//  sparkletest
//
//  Created by guru on 1/20/23.
//

import Foundation
import SwiftUI


// This additional view is needed for the disabled state on the menu item to work properly before Monterey.
// See https://stackoverflow.com/questions/68553092/menu-not-updating-swiftui-bug for more information
struct CheckForUpdatesView: View {
    @ObservedObject var updaterViewModel: UpdaterViewModel
    
    var body: some View {
        Button("Check for Updates…", action: updaterViewModel.checkForUpdates)
            .disabled(!updaterViewModel.canCheckForUpdates)
    }
}
