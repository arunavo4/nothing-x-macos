//
//  Nothing_X_MacOSApp.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 07/01/23.
//

import SwiftUI

@main
struct Nothing_X_MacOSApp: App {
    @StateObject var store = Store()
    
    var body: some Scene {
        MenuBarExtra {
            NavigationStack {
                HomeView()
                    .navigationDestination(for: Destination.self) { destination in
                        switch(destination) {
                            case .home: HomeView()
                            case .equalizer: EqualizerView()
                            case .controls: ControlsView()
                            case .controlsTripleTap: ControlsDetailView(destination: .controlsTripleTap)
                            case .controlsTapHold: ControlsDetailView(destination: .controlsTapHold)
                            case .settings: SettingsView()
                            case .findMyBuds: FindMyBudsView()
                        }
                    }
            }
            .environmentObject(store)
        } label: {
            Label("\(Double((self.store.leftBattery + self.store.rightBattery)) / 2.0, specifier: "%.0f")%", systemImage: "earbuds")
                .labelStyle(.titleAndIcon)
        }
        .menuBarExtraStyle(.window)
    
    }
}
