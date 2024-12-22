//
//  EpisodesCoordinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit

final class EpisodesCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .episodesDetail }
    var dependencies: IDependencies
    var navigationController: UINavigationController
    
    required init(dependencies: IDependencies) {
        self.dependencies = dependencies
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let episodesViewController = EpisodesAssembly.configure(dependencies)
        navigationController.setViewControllers([episodesViewController], animated: true)
//        navigationController.pushViewController(episodesViewController, animated: true)
    }
}
