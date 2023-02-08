//
//  Nothing_X_MacOSApp.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 07/01/23.
//

import SwiftUI

@main
struct Nothing_X_MacOSApp: App {
    @State var batteryPercent: String = "50"
    @State var indiceType: String = "square.fill" //circle | circle.fill | square | square.fill
    
    var body: some Scene {
        
        MenuBarExtra {
            ContentView()
        } label: {
            Label(batteryPercent, systemImage: "\(batteryPercent).\(indiceType)" )
        }
        .menuBarExtraStyle(.window)
    
    }
}
