//
//  ControlsDetailView.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 23/02/23.
//

import SwiftUI

struct ControlsDetailView: View {
    @EnvironmentObject var store: Store
    var destination: Destination
    
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
                HStack{
                    if(destination == .controlsTripleTap) {
                        Text("TRIPLE TAP")
                        Text("🔴🔴🔴").font(.system(size: 4, weight:.light))
                    }
                    else {
                        Text("TAP & HOLD")
                        Text("📍")
                            .rotationEffect(.degrees(-90))
                            .font(.system(size: 8, weight:.light))
                    }
                }
                
                Divider().foregroundColor(.black)
                
                VStack {
                    if(destination == .controlsTripleTap) {
                        Picker("", selection: $store.selectedTripleTapOp) {
                            ForEach(TripleTapOptions.allCases, id: \.self) {
                                Text($0.rawValue.capitalized)
                                    .padding(3)
                                    .padding(.leading, 26)
                            }
                        }
                    }
                    
                    else {
                        Picker("", selection: $store.selectedtapAndHoldOp) {
                            ForEach(TapAndHoldOptions.allCases, id: \.self) {
                                Text($0.rawValue.capitalized)
                                    .padding(3)
                                    .padding(.leading, 26)
                            }
                        }
                        
                        Divider().frame(width: 140)
                        
                        Text(store.fixedtapAndHoldOp.capitalized)
                            .padding(4)
                    }
                }
                .pickerStyle(.radioGroup)
                .labelsHidden()
                .frame(width: 165)
                .padding(10)
                .background(Color(#colorLiteral(red: 0.10980392247438431, green: 0.11372549086809158, blue: 0.12156862765550613, alpha: 1)))
                .font(.system(size: 10, weight:.light)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .cornerRadius(10)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding(4)
        .background(.black)
        .frame(width: 250, height: 230)
        .cornerRadius(8)
    }
}

struct ControlsDetailView_Previews: PreviewProvider {
    static let store = Store()
    static var previews: some View {
        ControlsDetailView(destination: .controlsTripleTap).environmentObject(store)
        ControlsDetailView(destination: .controlsTapHold).environmentObject(store)
    }
}
