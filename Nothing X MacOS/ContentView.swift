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


struct GreyImageButtonCicle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 32, height: 32)
            .background(Color(#colorLiteral(red: 0.10980392247438431, green: 0.11372549086809158, blue: 0.12156862765550613, alpha: 1)))
            .clipShape(Circle())
    }
}


struct OffWhiteButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(4)
            .frame(width: 90, height: 32)
            .background(Color(#colorLiteral(red: 0.7568627595901489, green: 0.7607843279838562, blue: 0.7686274647712708, alpha: 1)))
            .font(.system(size: 8, weight:.light)).foregroundColor(Color(#colorLiteral(red: 0.03, green: 0.03, blue: 0.04, alpha: 1)))
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


struct ContentView: View {
    @State var leftBattery = 45.0
    @State var caseBattery = 35.0
    @State var rightBattery = 40.0
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                
                // Settings
                Button(action: {
                    // Your action code here
                    print("Settings Button Pressed!")
                }) {
                    Image(systemName: "gearshape")
                }
                .buttonStyle(GreyImageButtonCicle())
                
                // Quit
                Button(action: {
                    // Your action code here
                    print("Quit Button Pressed!")
                    NSApplication.shared.terminate(nil)
                }) {
                    Image(systemName: "power.dotted").foregroundColor(Color(#colorLiteral(red: 0.8392156863, green: 0.1215686275, blue: 0.1294117647, alpha: 1)))
                }
                .buttonStyle(GreyImageButtonCicle())
                .keyboardShortcut("q")
            }
            
            
            HStack {
                // Left [Ear 1 Image + Battery]
                VStack {
                    // Ear 1 Image
                    Image("ear_1")
                    
                    // Battery Indicator
                    HStack {
                        // Left Battery
                        ProgressView("\(Int(leftBattery))% L", value: leftBattery, total: 100)
                            .progressViewStyle(LinearProgressViewStyle())
                            .frame(width: 50)
                            .padding(4)
                        
                        // Case Battery
                        ProgressView("\(Int(caseBattery))% C", value: caseBattery, total: 100)
                            .progressViewStyle(LinearProgressViewStyle())
                            .frame(width: 50)
                            .padding(4)
                        
                        // Right Battery
                        ProgressView("\(Int(rightBattery))% R", value: rightBattery, total: 100)
                            .progressViewStyle(LinearProgressViewStyle())
                            .frame(width: 50)
                            .padding(4)
                    }
                    
                }
                
                // Right [Controls]
                VStack {
                    //ear (1)
                    Text("ear (1)").font(.custom("5by7", size: 20)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    
                    Spacer(minLength: 16)
                    
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
                    
                    // NOISE CONTROL
                    ZStack {
                        //Card
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(#colorLiteral(red: 0.10980392247438431, green: 0.11372549086809158, blue: 0.12156862765550613, alpha: 1)))
                            .frame(width: 200, height: 124)
                        
                        VStack(alignment: .center) {
                            Text("NOISE CONTROL").font(.system(size: 8, weight: .regular)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8))).multilineTextAlignment(.center)
                            
                            Spacer(minLength: 10)
                            
                            //ANC Buttons
                            VStack {
                                
                                HStack {
                                    //ANC ON
                                    Button("ANC ON") {
                                        print("ANC ON Button pressed!")
                                    }
                                    .buttonStyle(BlackButton())
                                    
                                    //ANC OFF
                                    Button("ANC OFF") {
                                        print("ANC OFF Button pressed!")
                                    }
                                    .buttonStyle(BlackButton())
                                }
                                
                                //TRANSPARENCY
                                Button("TRANSPARENCY") {
                                    print("TRANSPARENCY Button pressed!")
                                }
                                .buttonStyle(OffWhiteButton())
                                
                            }
                            
                            Spacer()
                            
                        }
                        .padding(25)
                    }
                    
                    Spacer()
                
                }
            }
        }
        .padding()
        .background(.black)
        .frame(width: 460, height: 280)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
