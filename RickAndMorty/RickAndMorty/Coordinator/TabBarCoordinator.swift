//
//  TabBarCoordinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit
import Combine

final class TabBarCoordinator: Coordinator {
    
    var finishPublisher: PassthroughSubject<CoordinatorType, Never>
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .tabBar }
    var dependencies: IDependencies
    
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
//        self.navigationController.popToRootViewController(animated: true)

        self.dependencies = dependencies
        self.finishPublisher = .init()
    }
    
    func start() {
        showTabBarViewController()
    }
    
    private func showTabBarViewController() {
        let tabBarViewController = TabBerAssembly.configure(dependencies) as! TabBarViewController
        
        UIView.transition(with: navigationController.view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.navigationController.setViewControllers([tabBarViewController], animated: false)
        }, completion: nil)
        
        print(navigationController.viewControllers)
        
        let episodesCoordinator = EpisodesCoordinator(dependencies: dependencies)
        let favouritesCoordinator = FavouritesCoordinator(dependencies: dependencies)
        
        childCoordinators.append(episodesCoordinator)
        childCoordinators.append(favouritesCoordinator)
        
        // Настраиваем TabBarViewController
        episodesCoordinator.start()
        favouritesCoordinator.start()
        
        tabBarViewController.viewControllers = [episodesCoordinator.navigationController, favouritesCoordinator.navigationController]
        
        // Устанавливаем TabBar как rootViewController
//        window.rootViewController = tabBarViewController
//        window.makeKeyAndVisible()
    }
}
