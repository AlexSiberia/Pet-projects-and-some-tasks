//
//  EpisodesCoordinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit
import Combine

final class EpisodesCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .episodesDetail }
    var dependencies: IDependencies
    var navigationController: UINavigationController
    private var cancellables: Set<AnyCancellable> = []
    
    required init(dependencies: IDependencies) {
        self.dependencies = dependencies
        self.navigationController = UINavigationController()
    }
    
    func start() {
        showEpisodesViewController()
    }
    
    private func showEpisodesViewController() {
        let episodesViewController = EpisodesAssembly.configure(dependencies) as! EpisodesViewController
        navigationController.setViewControllers([episodesViewController], animated: true)
        episodesViewController.viewModel?.characterSelected
            .sink { [weak self] characterName in
                self?.showCharacterDetails(for: characterName)
        }
            .store(in: &cancellables)
    }
    
//    func showCharacterDetail() {
//        let characterDetailCoordinator = CharacterDetailsCoordinator(dependencies: dependencies)
//        childCoordinators.append(characterDetailCoordinator)
//        characterDetailCoordinator.start()
//    }
    
    private func showCharacterDetails(for characterName: String) {
        let characterDetailsCoordinator = CharacterDetailsCoordinator(
            dependencies: dependencies,
            navigationController: navigationController,
            characterName: characterName
        )
        characterDetailsCoordinator.start()
    }
}
