//
//  SceneDelegate.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private var dependencies: IDependencies = Dependencies()
    private var coordinator: AppCoordinatorProtocol?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        configureScene(windowScene)
        
    }
    
    private func configureScene(_ windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.makeKeyAndVisible()
        
        coordinator = AppCoordinator(window: window, dependencies: dependencies)
        coordinator?.start()
    }
    
    
}
