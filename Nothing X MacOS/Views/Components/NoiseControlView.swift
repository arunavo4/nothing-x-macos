//
//  NoiseControlView.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 15/02/23.
//

import SwiftUI

struct NoiseControlView: View {
    var body: some View {
        // NOISE CONTROL
        VStack(alignment: .center) {
            
            Text("NOISE CONTROL").font(.system(size: 10, weight: .regular)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8))).multilineTextAlignment(.center)
            
            Spacer()
            
            //ANC Buttons
            VStack {
                
                ZStack {
                    // Background
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color(#colorLiteral(red: 0.10980392247438431, green: 0.11372549086809158, blue: 0.12156862765550613, alpha: 1)))
                        .frame(width: 180, height: 34)
                    
                    // 3 buttons
                    HStack(spacing: 5) {
                        Button(action: {
                            // Your action code here
                            print("ANC ON Button Pressed!")
                        }) {
                            Image(systemName: "checkmark.seal.fill")
                                .font(.system(size: 14, weight:.regular)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)))
                        }
                        .buttonStyle(TransparentANCButton())
                        
                        
                        Button(action: {
                            // Your action code here
                            print("Transparency Button Pressed!")
                        }) {
                            Image(systemName: "cube.transparent.fill")
                                .font(.system(size: 14, weight:.regular)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8)))
                        }
                        .buttonStyle(OffWhiteANCButton())
                        
                        Button(action: {
                            // Your action code here
                            print("Transparency Button Pressed!")
                        }) {
                            Image(systemName: "xmark.seal.fill")
                                .font(.system(size: 14, weight:.regular)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)))
                        }
                        .buttonStyle(TransparentANCButton())
                    }
                    .fixedSize()
                    .frame(width: 180, height: 34)
                }
                
            }
            
            
        }
        .frame(width: 200, height: 60)
    }
}

struct NoiseControlView_Previews: PreviewProvider {
    static var previews: some View {
        NoiseControlView()
    }
}
