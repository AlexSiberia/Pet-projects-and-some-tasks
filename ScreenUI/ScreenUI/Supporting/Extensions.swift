////
////  Extensions.swift
////  ScreenUI
////
////  Created by Alexander Kurbatov on 10.10.2024.
////
//
//// MARK: - PinViewModelDelegate
//
//extension PinCodeViewController: PinViewModelDelegate {
//    func fetchedPinStates(pins: [PinModel]) {
//        states.pins = pins
//        print(states.pins)
//        PinCodeViewController.collectionView.reloadData()
//    }
//}
//
//// MARK: - KeyTapDelegate
//
//extension PinCodeViewController: KeyTapDelegate {
//    func didUpdateData(_ identifier: String) {
//        print(identifier)
//        states.udateDataFromVC(identifier)
//    }
//    
//    
//}
//
//// MARK: - CustomButtonCellDelegate
//
//extension PinCodeViewController: CustomButtonGoBackCellDelegate {
//    func didTapCloseButton(in cell: NavigationBarCell) {
//        // Возвращаемся на предыдущий экран
//        navigationController?.popViewController(animated: true)
//    }
//}
//
//// MARK: - FogotButtonCellDelegate
//
//extension PinCodeViewController: FogotButtonCellDelegate {
//    func didTapFogotButton(in cell: FogotButtonCell) {
//        // Возвращаемся на предыдущий экран
//        navigationController?.popViewController(animated: true)
//    }
//}
