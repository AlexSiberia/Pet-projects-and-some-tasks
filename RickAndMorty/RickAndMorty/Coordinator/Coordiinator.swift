//
//  Coordiinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit

enum CoordinatorType {
    case app, launch, tabBar, episodesDetail, favorites, charactersDetail
}

protocol Coordinator: AnyObject {
  
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var type: CoordinatorType { get }
    var dependencies: IDependencies { get }
    func start()
    func finish()
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
    
    }
}
