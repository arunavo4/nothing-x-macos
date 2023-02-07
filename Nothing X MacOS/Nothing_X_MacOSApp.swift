//
//  Nothing_X_MacOSApp.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 07/01/23.
//

import SwiftUI

@main
struct Nothing_X_MacOSApp: App {
    @State var currentNumber: String = "50"
    
    var body: some Scene {
        
        MenuBarExtra {
            ContentView()
        } label: {
            Label(currentNumber, systemImage: "\(currentNumber).circle")
        }
        .menuBarExtraStyle(.window)
    
    }
}
