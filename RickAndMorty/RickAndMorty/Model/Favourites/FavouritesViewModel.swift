//
//  Favourites.ViewModel.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit
import Combine

protocol FavouritesViewModelProtocol {
    var characterSelected: PassthroughSubject<String, Never> { get }
    func didTapCharacter(_ characterName: String)
}

final class FavouritesViewModel: FavouritesViewModelProtocol {
    let characterSelected = PassthroughSubject<String, Never>() // Паблишер для событий
    
    func didTapCharacter(_ characterName: String) {
        characterSelected.send(characterName) // Публикуем событие с именем персонажа
    }
    
    init(_ dependencies: IDependencies) {
//        summaryService = dependencies.summaryService
//        worldService = dependencies.worldService
    }
}
