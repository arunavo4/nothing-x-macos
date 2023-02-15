//
//  SettingsView.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 15/02/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var InEarDetection = true
    @State private var LowLagMode = true
    
    var body: some View {
        VStack {
            
            // Back - Heading - Settings | Quit
            HStack {
                // Back
                BackButtonView()
                
                Spacer()
                
                // Settings
                SettingsButtonView()
                
                // Quit
                QuitButtonView()
            }
            
            VStack(alignment: .center) {
                
                HStack {
                    // Heading
                    Text("DEVICE SETTINGS")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                
                VStack(alignment: .center) {
                    // IN-EAR DETECT
                    Toggle("IN-EAR DETECTION 􀅴", isOn: $InEarDetection).help(Text("Automatically play audio when earbuds are in and pause when removed"))
                    
                    // LOW LAG MODE
                    Toggle("LOW LAG MODE 􀅴", isOn: $LowLagMode).help(Text("Minimise latency for an improved gaming experience."))
                    
                    // Find My Earbuds
                    Button("FIND MY EARBUDS") {
                        print("FIND MY EARBUDS Pressed!")
                    }
                    .buttonStyle(FindMyTransparentButton())
                }
                .toggleStyle(SwitchToggleStyle())
                
                Spacer()

            }
            .frame(width: 200)
            
        }
        .padding(4)
        .background(.black)
        .frame(width: 250, height: 230)
        .cornerRadius(8)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
