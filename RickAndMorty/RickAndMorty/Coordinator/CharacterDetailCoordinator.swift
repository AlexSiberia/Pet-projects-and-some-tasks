//
//  CharacterDetailCoordinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit
import Combine

final class CharacterDetailsCoordinator: Coordinator {
    var finishPublisher: PassthroughSubject<CoordinatorType, Never>
    
    
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .charactersDetail }
    var dependencies: IDependencies
    var navigationController: UINavigationController
    private let characterName: String
    
    required init(dependencies: IDependencies, navigationController: UINavigationController, characterName: String) {
        self.dependencies = dependencies
        self.navigationController = navigationController
        self.characterName = characterName
        self.finishPublisher = .init()
    }
    
    func start() {
        showCharacterDetails()
    }
    
    private func showCharacterDetails() {
        let characterDetailsViewController = CharacterDetailsAssembly.configure(dependencies, characterName: characterName)
        
        // Настраиваем модальный стиль
           characterDetailsViewController.modalPresentationStyle = .fullScreen // или .pageSheet
           characterDetailsViewController.modalTransitionStyle = .coverVertical // или любой другой стиль

        // Находим верхний контроллер в navigationController и выполняем present
            navigationController.topViewController?.present(characterDetailsViewController, animated: true, completion: nil)
    }
}
