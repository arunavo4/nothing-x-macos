//
//  BackButtonView.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 15/02/23.
//

import SwiftUI

struct BackButtonView: View {
    var body: some View {
        Button(action: {
            // Your action code here
            print("Back Button Pressed!")
        }) {
            Image(systemName: "arrow.backward")
                .font(.system(size: 16))
        }
        .buttonStyle(BlackImageButtonCicle())
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
    }
}
