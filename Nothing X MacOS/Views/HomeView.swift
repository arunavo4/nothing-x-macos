//
//  HomeView.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 14/02/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack {
            HStack {
                Spacer(minLength: 5)
                
                // ear (1)
                DeviceNameDotTextView()
                
                VStack {
                    
                    // Settings | Quit
                    HStack {
                        Spacer()
                        
                        // Settings
                        SettingsButtonView()
                        
                        // Quit
                        QuitButtonView()
                    }
                    
                    VStack {
                        Spacer()
                        
                        //HStack - Equaliser | Controls
                        HStack(spacing: 5) {
                            //EQUALISER
                            NavigationLink("EQUALISER", value: Destination.equalizer)
                                .buttonStyle(GreyButton())
                            
                            //CONTROLS
                            NavigationLink("CONTROLS", value: Destination.controls)
                                .buttonStyle(GreyButton())
                        }
                        
                        Spacer()
                        
                        // NOISE CONTROL
                        NoiseControlView()
                        
                        Spacer()
                        
                        // Battery Indicator
                        BatteryIndicatorView()
                        
                        Spacer()
                    }
                    
                }
                
            }
        }
        .padding(0)
        .background(.black)
        .frame(width: 250, height: 230)
        .cornerRadius(8)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
