//
//  TabBarAssembly.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 14.12.2024.
//

import UIKit

final class TabBerAssembly {
    static func configure(_ dependencies: IDependencies) -> UIViewController {
        return dependencies.moduleContainer.getTabBarViewController()
    }
}
