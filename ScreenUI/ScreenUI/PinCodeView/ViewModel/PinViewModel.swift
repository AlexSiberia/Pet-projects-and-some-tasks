//
//  PinViewModel.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 19.09.2024.
//


class PinViewModel {
    
    weak var delegate: PinViewModelDelegate?
    
    var pins: [PinModel] = [PinModel(state: .inactive), PinModel(state: .inactive), PinModel(state: .inactive), PinModel(state: .inactive)]
    
    init(model: [PinModel]?) {
        if let inputModel = model {
            pins = inputModel
        }
        delegate?.fetchedPinStates(pins: pins)
    }
}
