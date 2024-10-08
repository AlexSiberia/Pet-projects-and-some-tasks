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

struct PinModel {
    var state: PinState
}
