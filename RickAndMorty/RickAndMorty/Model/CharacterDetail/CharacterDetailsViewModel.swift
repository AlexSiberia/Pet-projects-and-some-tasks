//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit

protocol CharacterDetailsViewModelProtocol {
//    private let characterName: String
    func getCharacterName() -> String
}

final class CharacterDetailsViewModel: CharacterDetailsViewModelProtocol {
    private let characterName: String
    init(_ dependencies: IDependencies, characterName: String) {
        self.characterName = characterName
//        summaryService = dependencies.summaryService
//        worldService = dependencies.worldService
    }
    
    func getCharacterName() -> String {
            return characterName
        }
}
