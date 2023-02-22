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
    
    @State var batteryPercent: String = "49"
    let indiceType: String = "circle" //circle | circle.fill | square | square.fill
    
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
            Label(batteryPercent, systemImage: "\(batteryPercent).\(indiceType)" )
        }
        .menuBarExtraStyle(.window)
    
    }
}
