//
//  PinViewModel.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 19.09.2024.
//

class PinViewModel {
    
    weak var delegate: PinViewModelDelegate?

    init(model: [PinModel]? = nil) {
        if let inputModel = model {
            pins = inputModel
        }
        self.delegate?.fetchedPinStates(pins: pins)
    }
    var count: Int = 0
    var pins: [PinModel] = [PinModel(state: .active), PinModel(state: .inactive), PinModel(state: .inactive), PinModel(state: .inactive)]
    
//    func udateDataFromVC(_ identifier: String) {
//        print("VM\(identifier)")
//        
//        switch identifier {
//        case "keyButton0":
//            pins[count].state = .active
//            count += 1
//            delegate?.fetchedPinStates(pins: pins)
//        case "keyButton1":
//            pins[count].state = .active
//            count += 1
//            delegate?.fetchedPinStates(pins: pins)
//        case "keyButton2":
//            pins[count].state = .active
//            count += 1
//            delegate?.fetchedPinStates(pins: pins)
//        case "keyButton3":
//            pins[count].state = .active
//            count += 1
//            delegate?.fetchedPinStates(pins: pins)
//        case "keyButton4":
//            pins[count].state = .active
//            count += 1
//            delegate?.fetchedPinStates(pins: pins)
//        case "keyButton5":
//            pins[count].state = .active
//            count += 1
//            delegate?.fetchedPinStates(pins: pins)
//        case "keyButton6":
//            pins[count].state = .active
//            count += 1
//            delegate?.fetchedPinStates(pins: pins)
//        case "keyButton7":
//            pins[count].state = .active
//            count += 1
//            delegate?.fetchedPinStates(pins: pins)
//        case "keyButton8":
//            pins[count].state = .active
//            count += 1
//            delegate?.fetchedPinStates(pins: pins)
//        case "keyButton9":
//            pins[count].state = .active
//            count += 1
//            delegate?.fetchedPinStates(pins: pins)
//        case "keyButtonDel":
//            pins[count].state = .active
//            count += 1
//            delegate?.fetchedPinStates(pins: pins)
//        default:
//            break
//        }
//    }
}

//extension PinViewModel: KeyTapDelegate {
//    func didUpdateData(_ identifier: String) {
//        
//    }
//}
