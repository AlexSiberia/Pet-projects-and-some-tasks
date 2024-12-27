//
//  CharacterDetailCoordinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit

final class CharacterDetailsCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .charactersDetail }
    var dependencies: IDependencies
    var navigationController: UINavigationController
    private let characterName: String
    
    required init(dependencies: IDependencies, navigationController: UINavigationController, characterName: String) {
        self.dependencies = dependencies
        self.navigationController = navigationController
        self.characterName = characterName
    }
    
    func start() {
        showCharacterDetails()
    }
    
    private func showCharacterDetails() {
        let characterDetailsViewController = CharacterDetailsAssembly.configure(dependencies, characterName: characterName)
//        navigationController.pushViewController(characterDetailsViewController, animated: true)
        
        // Настраиваем модальный стиль
           characterDetailsViewController.modalPresentationStyle = .fullScreen // или .pageSheet
           characterDetailsViewController.modalTransitionStyle = .coverVertical // или любой другой стиль

        // Находим верхний контроллер в navigationController и выполняем present
            navigationController.topViewController?.present(characterDetailsViewController, animated: true, completion: nil)
    }
}
