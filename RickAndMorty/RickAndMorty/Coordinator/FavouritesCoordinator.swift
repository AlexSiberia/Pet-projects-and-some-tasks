//
//  FavouritesCoordinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit
import Combine

final class FavouritesCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .favorites }
    var dependencies: IDependencies
    var navigationController: UINavigationController
    private var cancellables: Set<AnyCancellable> = []
    
    required init(dependencies: IDependencies) {
        self.dependencies = dependencies
        self.navigationController = UINavigationController()
    }
    
    func start() {
        showFavouritesViewController()
    }
    
    private func showFavouritesViewController() {
        let favouritesViewController = FavouritesAssembly.configure(dependencies) as! FavouritesViewController
        navigationController.setViewControllers([favouritesViewController], animated: true)
        favouritesViewController.viewModel?.characterSelected
            .sink { [weak self] characterName in
                self?.showCharacterDetails(for: characterName)
        }
            .store(in: &cancellables)
    }
    
    private func showCharacterDetails(for characterName: String) {
        let characterDetailsCoordinator = CharacterDetailsCoordinator(
            dependencies: dependencies,
            navigationController: navigationController,
            characterName: characterName
        )
        characterDetailsCoordinator.start()
    }
}
