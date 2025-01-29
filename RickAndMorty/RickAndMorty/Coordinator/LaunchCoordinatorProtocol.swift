//
//  LaunchCoordinatorProtocol.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 19.01.2025.
//


//
//  LanchCoordinator.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 13.12.2024.
//

import UIKit
import Combine

protocol LaunchCoordinatorProtocol: Coordinator {
    func start()
}

final class LaunchCoordinator: LaunchCoordinatorProtocol {
    var finishPublisher: PassthroughSubject<CoordinatorType, Never>
    
    private let window: UIWindow
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .launch }
    var dependencies: IDependencies
    required init(window: UIWindow, dependencies: IDependencies) {
        self.window = window
        self.dependencies = dependencies
        self.finishPublisher = .init()
    }
    
    func start() {
        showLaunchViewController()
    }
    
    private func showLaunchViewController() {
        let launchViewController = LaunchAssembly.configure(dependencies) as! LaunchViewController

        window.rootViewController = launchViewController
        window.makeKeyAndVisible()
        
        launchViewController.onFinish = { [weak self]  in
            self?.finish()
        }
    }
    
//    func finish() {
//        finishPublisher.send(type)
//    }
}
