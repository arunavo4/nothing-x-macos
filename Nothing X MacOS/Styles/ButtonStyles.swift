//
//  ButtonStyles.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 13/02/23.
//

import Foundation
import SwiftUI


struct GreyButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 90, height: 34)
            .background(Color(#colorLiteral(red: 0.10980392247438431, green: 0.11372549086809158, blue: 0.12156862765550613, alpha: 1)))
            .font(.system(size: 10, weight:.light)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)))
            .clipShape(Capsule())
    }
}


struct GreyImageButtonCicle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 28, height: 28)
            .background(Color(#colorLiteral(red: 0.10980392247438431, green: 0.11372549086809158, blue: 0.12156862765550613, alpha: 1)))
            .clipShape(Circle())
    }
}


struct BlackImageButtonCicle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 28, height: 28)
            .background(.black)
            .clipShape(Circle())
    }
}


struct OffWhiteConnectButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(4)
            .frame(width: 120, height: 30)
            .background(Color(#colorLiteral(red: 0.7568627595901489, green: 0.7607843279838562, blue: 0.7686274647712708, alpha: 1)))
            .font(.system(size: 10, weight:.regular)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)))
            .clipShape(Capsule())
    }
}

struct OffWhiteANCButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(4)
            .frame(width: 56, height: 34)
            .background(Color(#colorLiteral(red: 0.7568627595901489, green: 0.7607843279838562, blue: 0.7686274647712708, alpha: 1)))
            .font(.system(size: 10, weight:.regular)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)))
            .clipShape(Capsule())
    }
}

struct TransparentANCButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(4)
            .frame(width: 56, height: 34)
            .background(Color(#colorLiteral(red: 0.7568627595901489, green: 0.7607843279838562, blue: 0.7686274647712708, alpha: 0)))
            .font(.system(size: 10, weight:.regular)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .clipShape(Capsule())
    }
}


struct BlackButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(4)
            .frame(width: 80, height: 32)
            .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            .font(.system(size: 8, weight:.light)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)))
            .clipShape(Capsule())
    }
}
