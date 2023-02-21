//
//  ControlsView.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 14/02/23.
//

import SwiftUI

enum EarBudSide: String, CaseIterable, Identifiable {
    case left
    case right

    var id: String { self.rawValue }
}


struct CustomPickerView<SelectionValue: Hashable>: View {
    var items: [CustomPickerItem]
    @Binding var selection: SelectionValue
    
    var body: some View {
        HStack {
            ForEach(items) { item in
                VStack {
                    Text(item.title)
                        .padding()
                        .onTapGesture {
                            selection = item.tag as! SelectionValue
                        }
                    if selection == item.tag as! SelectionValue {
                        Rectangle()
                            .frame(height: 4)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

struct CustomPickerItem: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var tag: AnyHashable
}


struct ControlsView: View {
    private let tripleTapOptions = ["SKIP FORWARD", "SKIP BACK", "VOICE ASSISTANT", "NO ACTION"]
    private let tapAndHoldOptions = ["NOISE CONTROL", "NO EXTRA ACTION"]
    
    @State private var selectedTripleTapOp = "SKIP FORWARD"
    @State private var selectedtapAndHoldOp = "NOISE CONTROL"
    
    @State private var selectedSide = EarBudSide.left
    
    let items = [
            CustomPickerItem(title: "Item 1", tag: 0),
            CustomPickerItem(title: "Item 2", tag: 1),
            CustomPickerItem(title: "Item 3", tag: 2)
        ]
        
    @State private var selection = 0
    
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
                
                // Left - Right
                Picker("", selection: $selectedSide) {
                    ForEach(EarBudSide.allCases) { side in
                        Text(side.rawValue.uppercased())
                            .tag(side)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                CustomPickerView(items: items, selection: $selection)
                
                
                Spacer()
                
                // Selector Menu
                VStack {
                    Picker("Triple Tap Options", selection: $selectedTripleTapOp) {
                        ForEach(tripleTapOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    Text(selectedTripleTapOp)
                }
                
                
                // Battery Indicator
                BatteryIndicatorView()
                
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

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
    }
}
