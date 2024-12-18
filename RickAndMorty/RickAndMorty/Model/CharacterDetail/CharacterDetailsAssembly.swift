//
//  CharacterDetailAssembly.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit

final class CharacterDetailsAssembly {
    
    static func configure(_ dependency: IDependencies) -> UIViewController {
        return dependency.moduleContainer.getCharacterDetailsViewController()
    }
}
