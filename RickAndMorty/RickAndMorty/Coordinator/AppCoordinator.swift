//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func start()
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    private let window: UIWindow
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }
//    private let userDefaultsRepository: IUserDefaultsRepository
    var dependencies: IDependencies
    
    required init(window: UIWindow, dependencies: IDependencies) {
        self.window = window
        self.dependencies = dependencies
//        self.userDefaultsRepository = dependencies.userDefaultsRepository
    }
    
    func start() {
        showLaunchFlow()
    }
    
    private func showLaunchFlow() {
        let launchCoordinator = LaunchCoordinator(window: window, dependencies: dependencies)
        // Запускаем координатор для LaunchScreen
        launchCoordinator.start()
        
        // По завершении анимации переключаемся на TabBar
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.showMainFlow()
        }
        
    }
    
    private func showMainFlow() {
        // Удаляем координатор LaunchScreen
        childCoordinators.removeAll()
        
        // Создаем координатор для TabBar
        let tabBarCoordinator = TabBarCoordinator(window: window, dependencies: dependencies)
        childCoordinators.append(tabBarCoordinator)
        tabBarCoordinator.start()
        
    }
}
