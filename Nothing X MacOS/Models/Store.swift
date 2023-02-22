//
//  Store.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 21/02/23.
//

import Foundation


enum TripleTapOptions: String, CaseIterable, Hashable {
    case skip_forward = "skip forward"
    case skip_back = "skip back"
    case voice_assistant = "voice assistant"
    case no_action = "no action"
}

enum TapAndHoldOptions: String, CaseIterable, Hashable {
    case noise_control = "noise control"
    case no_extra_action = "no extra action"
}

enum EarBudSide: String, CaseIterable, Identifiable, Hashable {
    case left
    case right

    var id: String { self.rawValue }
}

class Store: ObservableObject {
    @Published var selectedTripleTapOp: TripleTapOptions = TripleTapOptions.skip_forward
    @Published var selectedtapAndHoldOp: TapAndHoldOptions = TapAndHoldOptions.noise_control
    @Published var fixedtapAndHoldOp = "decline incoming call"
    
    @Published var earBudSelectedSide = EarBudSide.left.rawValue
    
    @Published var leftBattery: Float16 = 50
    @Published var caseBattery: Float16 = 70
    @Published var rightBattery: Float16 = 50
    
    
}
