//
//  ContentView.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 07/01/23.
//

import SwiftUI


struct GreyButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 90, height: 34)
            .background(Color(#colorLiteral(red: 0.10980392247438431, green: 0.11372549086809158, blue: 0.12156862765550613, alpha: 1)))
            .font(.system(size: 8, weight:.light)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)))
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    @State var currentNumber: String = "1"
    
    var body: some View {
        VStack {
            //ear (1)
            Text("ear (1)").font(.custom("5by7", size: 20)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            
//            Spacer()
            
            //HStack - Equaliser | Controls
            HStack {
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
            
            
        
        }
        .frame(width: 448, height: 239)

//        Button("Quit") {
//            NSApplication.shared.terminate(nil)
//        }.keyboardShortcut("q")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
