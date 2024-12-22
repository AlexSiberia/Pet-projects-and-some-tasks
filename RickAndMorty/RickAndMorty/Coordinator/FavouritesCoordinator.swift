//
//  FavouritesCoordinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit

final class FavouritesCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .favorites }
    var dependencies: IDependencies
    var navigationController: UINavigationController
    
    required init(dependencies: IDependencies) {
        self.dependencies = dependencies
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let favouritesViewController = FavouritesAssembly.configure(dependencies)
    }
}
