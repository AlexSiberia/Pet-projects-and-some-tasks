//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit
import Combine

protocol EpisodesViewModelProtocol {
    var characterSelected: PassthroughSubject<String, Never> { get }
    func didTapCharacter(_ characterName: String)
    
}

protocol ViewModel {
    associatedtype Input
    associatedtype Output

    var input: Input { get }
    var output: Output { get }
}

final class EpisodesViewModel: EpisodesViewModelProtocol {
    let characterSelected = PassthroughSubject<String, Never>() // Паблишер для событий
    
    func didTapCharacter(_ characterName: String) {
        characterSelected.send(characterName) // Публикуем событие с именем персонажа
    }
    init(_ dependencies: IDependencies) {
        //        summaryService = dependencies.summaryService
        //        worldService = dependencies.worldService
    }
}
