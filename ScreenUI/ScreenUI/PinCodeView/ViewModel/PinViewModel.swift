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
//        self.delegate?.fetchedPinStates(pins: pins)
    }
    var count: Int = 0
    var confirmedCount: Int = 0
    private var pinNumbers: [Int] = []
    private var confirmedPinNumbers: [Int] = []
    
    var pins: [PinModel] = [PinModel(state: .inactive), PinModel(state: .inactive), PinModel(state: .inactive), PinModel(state: .inactive)]
    
    func udateDataFromVC(_ identifier: String) {
        print("VM\(identifier)")
        
        switch identifier {
        case "0":
            pins[count].state = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
            delegate?.fetchedPinStates(pins: pins)
        case "1":
            pins[count].state = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
            delegate?.fetchedPinStates(pins: pins)
        case "2":
            pins[count].state = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
            delegate?.fetchedPinStates(pins: pins)
        case "3":
            pins[count].state = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
            delegate?.fetchedPinStates(pins: pins)
        case "4":
            pins[count].state = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
            delegate?.fetchedPinStates(pins: pins)
        case "5":
            pins[count].state = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
            delegate?.fetchedPinStates(pins: pins)
        case "6":
            pins[count].state = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
            delegate?.fetchedPinStates(pins: pins)
        case "7":
            pins[count].state = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
            delegate?.fetchedPinStates(pins: pins)
        case "8":
            pins[count].state = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
            delegate?.fetchedPinStates(pins: pins)
        case "9":
            pins[count].state = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
            delegate?.fetchedPinStates(pins: pins)
        case "keyButtonDel":
            pins[count].state = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
            delegate?.fetchedPinStates(pins: pins)
        default:
            break
        }
        
        if count == 4 && confirmedCount == 0 {
            confirmedPinNumbers = pinNumbers
            pinNumbers.removeAll()
            confirmedCount = count
            count = 0
            delegate?.enteredPin()
        } else if count == 4 && confirmedCount == 4 {
            if confirmedPinNumbers == pinNumbers {
                // Переход на другой экран
                delegate?.happyPin()
            } else {
                // Показать пины красным цветом и перейти на экран ввода пинкода
            }
        }
    }
}
