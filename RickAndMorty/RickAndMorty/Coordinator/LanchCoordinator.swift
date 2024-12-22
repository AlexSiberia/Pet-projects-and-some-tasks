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
    
    private let window: UIWindow
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .launch }
    var dependencies: IDependencies
    required init(window: UIWindow, dependencies: IDependencies) {
        self.window = window
        self.dependencies = dependencies
    }
    
    func start() {
        showLaunchViewController()
    }
    
    func showLaunchViewController() {
        let launchViewController = LaunchAssembly.configure(dependencies)

        window.rootViewController = launchViewController
        window.makeKeyAndVisible()
    }
}
