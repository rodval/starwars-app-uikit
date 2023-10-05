//
//  CharacterListViewModel.swift
//  StarWars
//
//  Created by Rodrigo Valladares on 13/6/23.
//

import Foundation
import Combine

protocol DelegateGetCharacter: AnyObject {
    func retriveData(data: [CharacterResponse])
}

class CharacterListViewModel: ObservableObject {
    typealias Dependencies = HasStarWarsServiceType
    
    // MARK: - Published variables
    @Published var characterList: [CharacterResponse] = []
    
    // MARK: - Properties
    private var dependencies: Dependencies
    private var cancellables: Set<AnyCancellable> = []
    
    var error: String = ""
    
    // MARK: - Initialization
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Setup
    func setup() {
        fetchCharacterList()
    }
    
    private func fetchCharacterList() {
        dependencies
            .starWarsServiceType
            .getStarWarsCharacter()
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] response in
                guard case let .failure(error) = response else { return }
                
                self?.error = error.localizedDescription
            } receiveValue: { [weak self] result in
                self?.characterList = result
            }.store(in: &cancellables)
    }
}

struct CharacterListViewModelDependencies: HasStarWarsServiceType {
    var starWarsServiceType: StarWarsServiceType {
        StarWarsService(dependencies: StarWarServiceDependencies())
    }
}
