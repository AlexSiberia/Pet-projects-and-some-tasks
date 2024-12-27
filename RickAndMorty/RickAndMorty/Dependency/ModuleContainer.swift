//
//  ModuleContainer.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit

protocol IModuleContainer {
    func getLanchViewController() -> UIViewController
    func getTabBarViewController() -> UIViewController
    func getEpisodesViewController() -> UIViewController
    func getFavouritesViewController() -> UIViewController
    func getCharacterDetailsViewController(characterName: String) -> UIViewController
}

final class ModuleContainer: IModuleContainer {
    private let dependencies: IDependencies
    required init(_ dependencies: IDependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - LaunchVC
extension ModuleContainer {
    func getLanchViewController() -> UIViewController {
        return LaunchViewController()
    }
}

// MARK: - TabBarVC
extension ModuleContainer {
    func getTabBarViewController() -> UIViewController {
        let view = TabBarViewController()
        return view
    }
}

// MARK: - EpisodesVC
extension ModuleContainer {
    func getEpisodesViewController() -> UIViewController {
        let view = EpisodesViewController()
        let viewModel = EpisodesViewModel(dependencies)
        view.viewModel = viewModel
        
        return view
    }
}

// MARK: - FavouritesVC
extension ModuleContainer {
    func getFavouritesViewController() -> UIViewController {
        let view = FavouritesViewController()
        let viewModel = FavouritesViewModel(dependencies)
        view.viewModel = viewModel
        
        return view
    }
}

// MARK: - CharacterDetailsVC
extension ModuleContainer {
    func getCharacterDetailsViewController(characterName: String) -> UIViewController {
        let view = CharacterDetailsViewController()
        let viewModel = CharacterDetailsViewModel(dependencies, characterName: characterName)
        view.viewModel = viewModel
        
        return view
    }
}
