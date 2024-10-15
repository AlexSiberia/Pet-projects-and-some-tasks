//
//  Protocols.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 10.10.2024.
//

protocol PinViewModelDelegate: AnyObject {
    func fetchedPinStates(pins: [PinModel])
    func enteredPin()
    func happyPin()
}

protocol KeyTapDelegate: AnyObject {
    func didUpdateData(_ identifier: String)
}

protocol FirstPinEnteredDelegate: AnyObject {
    func updateCellTitle(isComplete: Bool)
    func updateCell() 
}

//protocol SubTitleCellDelegate: AnyObject {
//    func updateSubTitle(isComplete: Bool)
//}
