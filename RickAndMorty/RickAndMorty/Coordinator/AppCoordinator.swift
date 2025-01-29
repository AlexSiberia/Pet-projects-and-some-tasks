//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit
import Combine

protocol AppCoordinatorProtocol: Coordinator {
    func start()
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    var finishPublisher = PassthroughSubject<CoordinatorType, Never>() // Combine Publisher
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }
//    private let userDefaultsRepository: IUserDefaultsRepository
    var dependencies: IDependencies
    
    private var cancellables = Set<AnyCancellable>() // Combine для подписок
    
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
//        self.userDefaultsRepository = dependencies.userDefaultsRepository
    }
    
    func start() {
        showLaunchFlow()
    }
    
    private func showLaunchFlow() {
        let launchCoordinator = LaunchCoordinator(navigationController, dependencies: dependencies)
        // Запускаем координатор для LaunchScreen
        launchCoordinator.start()
        
        // Подписываемся на завершение координатора
        launchCoordinator.finishPublisher
            .sink { [weak self] coordinatorType in
                switch coordinatorType {
                case .launch:
                    self?.showMainFlow()
                default:
                    break
                }
            }
            .store(in: &cancellables)
        
        childCoordinators.append(launchCoordinator)
    }
    
    private func showMainFlow() {
        // Удаляем координатор LaunchScreen
        childCoordinators.removeAll()
        
        // Создаем координатор для TabBar
        let tabBarCoordinator = TabBarCoordinator(navigationController, dependencies: dependencies)
        childCoordinators.append(tabBarCoordinator)
        tabBarCoordinator.start()
        
    }
}
