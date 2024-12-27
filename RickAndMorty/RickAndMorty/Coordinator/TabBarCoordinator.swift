//
//  TabBarCoordinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    
    private let window: UIWindow
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .tabBar }
    var dependencies: IDependencies
    
    required init(window: UIWindow, dependencies: IDependencies) {
        self.window = window
        self.dependencies = dependencies
    }
    
    func start() {
        showTabBarViewController()
    }
    
    private func showTabBarViewController() {
        let tabBarViewController = TabBerAssembly.configure(dependencies) as! TabBarViewController
        
        let episodesCoordinator = EpisodesCoordinator(dependencies: dependencies)
        let favouritesCoordinator = FavouritesCoordinator(dependencies: dependencies)
        
        childCoordinators.append(episodesCoordinator)
        childCoordinators.append(favouritesCoordinator)
        
        // Настраиваем TabBarViewController
        episodesCoordinator.start()
        favouritesCoordinator.start()
        
        tabBarViewController.viewControllers = [episodesCoordinator.navigationController, favouritesCoordinator.navigationController]
        
        // Устанавливаем TabBar как rootViewController
        window.rootViewController = tabBarViewController
        window.makeKeyAndVisible()
    }
}
