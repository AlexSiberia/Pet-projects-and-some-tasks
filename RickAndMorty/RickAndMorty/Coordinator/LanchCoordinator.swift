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
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .launch }
    var dependencies: IDependencies
    
    private var cancellables = Set<AnyCancellable>() // Combine для подписок
    
    required init(_ navigationController: UINavigationController, dependencies: IDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        self.finishPublisher = .init()
    }
    
    func start() {
        showLaunchViewController()
    }
    
    private func showLaunchViewController() {
        let launchViewController = LaunchAssembly.configure(dependencies) as! LaunchViewController
        
        navigationController.show(launchViewController, sender: nil)
//        navigationController.pushViewController(launchViewController, animated: true)

//        window.rootViewController = launchViewController
//        window.makeKeyAndVisible()
        
        launchViewController.onFinishPublisher
            .sink { [weak self] in
                print("onFinishPublisher вызван")
                self?.finish()
                
            }
            .store(in: &cancellables)
    }
}
