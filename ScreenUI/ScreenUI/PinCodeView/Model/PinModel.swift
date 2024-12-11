//
//  PinModel.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 19.09.2024.
//

import Foundation

enum PinState {
    case active
    case inactive
}

class PinModel {
    @Published var pinsState: [PinState] = [.inactive, .inactive, .inactive, .inactive]
    @Published var isPinEntered: Bool = false
    @Published var isPinConfirmed: Bool = false
}
