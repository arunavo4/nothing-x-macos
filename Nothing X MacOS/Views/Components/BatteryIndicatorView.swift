//
//  BatteryIndicatorView.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 15/02/23.
//

import SwiftUI

struct BatteryIndicatorView: View {
    @State var leftBattery = 45.0
    @State var caseBattery = 35.0
    @State var rightBattery = 40.0
    
    var body: some View {
        HStack(spacing: 10) {
            // Left Battery
            ProgressView("\(Int(leftBattery))% L", value: leftBattery, total: 100)
                .progressViewStyle(NothingProgressViewStyle())
            
            // Case Battery
            ProgressView("\(Int(caseBattery))% C", value: caseBattery, total: 100)
                .progressViewStyle(NothingProgressViewStyle())
            
            // Right Battery
            ProgressView("\(Int(rightBattery))% R", value: rightBattery, total: 100)
                .progressViewStyle(NothingProgressViewStyle())
        }
        .frame(width: 170)
    }
}

struct BatteryIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryIndicatorView()
    }
}
