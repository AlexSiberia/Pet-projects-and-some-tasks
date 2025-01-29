//
//  Coordiinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit
import Combine

enum CoordinatorType {
    case app, launch, tabBar, episodesDetail, favorites, charactersDetail
}

protocol Coordinator: AnyObject {
  
    var finishPublisher: PassthroughSubject<CoordinatorType, Never> { get } // Combine Publisher
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorType { get }
    var dependencies: IDependencies { get }
    func start()
    func finish()
}

extension Coordinator {
    func finish() {
        print("Finish вызван")
        print("1- \(childCoordinators)")
        childCoordinators.removeAll()
        print("2- \(childCoordinators)")
        finishPublisher.send(type)
    }
}
