//
//  PinViewModel.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 19.09.2024.
//
import Combine

struct PinViewModel {
//    @Published var isPinEntered: Bool = false
//    @Published var isPinConfirmed: Bool = false
//    @Published var pins: [PinModel] = [
//        PinModel(state: .inactive),
//        PinModel(state: .inactive),
//        PinModel(state: .inactive),
//        PinModel(state: .inactive)
//    ]
    var pins = PinModel()
    
    lazy var pinStateSubject: AnyPublisher<[PinState], Never> = {
        return pins.$pinsState.eraseToAnyPublisher()
    }()
    
    
    weak var delegate: PinViewModelDelegate?

//    init(model: PinModel? = nil) {
//        if let inputModel = model {
//            self.pins = inputModel
//        }
//    }
    
    var count: Int = 0
    var confirmedCount: Int = 0
    private var pinNumbers: [Int] = []
    private var confirmedPinNumbers: [Int] = []
    
    mutating func udateDataFromVC(_ identifier: String) {
        print("VM\(identifier)")
        
        switch identifier {
        case "0":
            pins.pinsState[count] = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
//            delegate?.fetchedPinStates(pins: pins)
        case "1":
            pins.pinsState[count] = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
//            delegate?.fetchedPinStates(pins: )
        case "2":
            pins.pinsState[count] = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
//            delegate?.fetchedPinStates(pins: pins)
        case "3":
            pins.pinsState[count] = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
//            delegate?.fetchedPinStates(pins: pins)
        case "4":
            pins.pinsState[count] = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
//            delegate?.fetchedPinStates(pins: pins)
        case "5":
            pins.pinsState[count] = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
//            delegate?.fetchedPinStates(pins: pins)
        case "6":
            pins.pinsState[count] = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
//            delegate?.fetchedPinStates(pins: pins)
        case "7":
            pins.pinsState[count] = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
//            delegate?.fetchedPinStates(pins: pins)
        case "8":
            pins.pinsState[count] = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
//            delegate?.fetchedPinStates(pins: pins)
        case "9":
            pins.pinsState[count] = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
//            delegate?.fetchedPinStates(pins: pins)
        case "keyButtonDel":
            pins.pinsState[count] = .active
            count += 1
            pinNumbers.append(Int(identifier) ?? 0)
//            delegate?.fetchedPinStates(pins: pins)
        default:
            break
        }
        
        if count == 4 && confirmedCount == 0 {
            confirmedPinNumbers = pinNumbers
            pinNumbers.removeAll()
            confirmedCount = count
            count = 0
            pins.isPinEntered = true
//            delegate?.enteredPin()
        } else if count == 4 && confirmedCount == 4 {
            if confirmedPinNumbers == pinNumbers {
                // Переход на другой экран
                pins.isPinConfirmed = true
//                delegate?.happyPin()
            } else {
                // Показать пины красным цветом и перейти на экран ввода пинкода
            }
        }
    }
}
