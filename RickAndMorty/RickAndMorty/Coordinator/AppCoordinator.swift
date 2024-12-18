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
    
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }
//    private let userDefaultsRepository: IUserDefaultsRepository
    var dependencies: IDependencies
    
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
        self.dependencies = dependencies
//        self.userDefaultsRepository = dependencies.userDefaultsRepository
    }
    
    func start() {
        showLaunchFlow()
    }
    
    func showLaunchFlow() {
        let launchCoordinator = LaunchCoordinator(navigationController, dependencies: dependencies)
//        launchCoordinator.finishDelegate = self
        //        if userDefaultsRepository.isOnboardingCompleteBefore {
        //            launchCoordinator.start()
        //        } else {
        //            launchCoordinator.startFirstLaunch()
        //        }
        
        childCoordinators.append(launchCoordinator)
    }
}
