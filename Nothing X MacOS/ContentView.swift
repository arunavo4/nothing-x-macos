//
//  ContentView.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 07/01/23.
//

import SwiftUI

struct ContentView: View {
    @State var currentNumber: String = "1"
    
    var body: some View {
        Text("Scanning for Headphones")
                    .onAppear {
                        BluetoothManager.shared
                    }
        Divider()

        Button("Quit") {
            NSApplication.shared.terminate(nil)
        }.keyboardShortcut("q")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
