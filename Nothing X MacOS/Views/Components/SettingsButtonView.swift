//
//  SettingsButtonView.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 15/02/23.
//

import SwiftUI

struct SettingsButtonView: View {
    var body: some View {
        // Settings
        Button(action: {
            // Your action code here
            print("Settings Button Pressed!")
        }) {
            Image(systemName: "gearshape")
                .font(.system(size: 16))
        }
        .buttonStyle(BlackImageButtonCicle())
    }
}

struct SettingsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonView()
    }
}
