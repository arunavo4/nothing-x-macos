//
//  HomeView.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 14/02/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack(alignment: .leading){
            HStack() {
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
                            Button("EQUALISER") {
                                print("EQUALISER Button pressed!")
                            }
                            .buttonStyle(GreyButton())
                            
                            //CONTROLS
                            Button("CONTROLS") {
                                print("CONTROLS Button pressed!")
                            }
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
        .padding(4)
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
