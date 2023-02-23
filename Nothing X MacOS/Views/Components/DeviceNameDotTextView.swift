//
//  DeviceNameDotTextView.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 15/02/23.
//

import SwiftUI

struct DeviceNameDotTextView: View {
    var body: some View {
        VStack {
            Spacer(minLength: 5)
            //ear (1)
            Text("ear (1)")
                .font(.custom("5by7", size: 20)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .rotationEffect(.degrees(-90))
                .padding()
                .fixedSize()
                .frame(width: 14, height: 66)
            Spacer(minLength: 150)
        }
    }
}

struct DeviceNameDotTextView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceNameDotTextView()
    }
}
