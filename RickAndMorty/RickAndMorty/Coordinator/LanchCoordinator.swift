//
//  LanchCoordinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 13.12.2024.
//

import UIKit

protocol LaunchCoordinatorProtocol: Coordinator {
    func start()
}

final class LaunchCoordinator: LaunchCoordinatorProtocol {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .launch }
    var dependencies: IDependencies
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        showLaunchViewController()
    }
    
    func showLaunchViewController() {
        let launchViewController = LaunchAssembly.configure(dependencies)
//        if let launchViewController = launchViewController as? LaunchViewController {
//            launchViewController.isShowOnboardingBefore = isShowOnboardingBefore
//            launchViewController.didSendEventHandler = { [weak self] event in
//                switch event {
//                case .launchComplete:
//                    self?.finish()
//                }
//            }
//        }
        navigationController.show(launchViewController, sender: self)
       // navigationController.pushViewController(launchViewController, animated: true)
    }
}
