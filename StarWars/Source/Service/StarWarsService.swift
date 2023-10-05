//
//  StarWarsService.swift
//  StarWars
//
//  Created by Rodrigo Valladares on 13/6/23.
//

import Foundation
import Combine

// MARK: Protocol
protocol StarWarsServiceType {
    func getStarWarsCharacter() -> AnyPublisher<[CharacterResponse], Error>
    func getImage(url: String) -> AnyPublisher<Data, Error>
}

// MARK: Dependency Protocol
protocol HasStarWarsServiceType {
    var starWarsServiceType: StarWarsServiceType { get }
}

// MARK: - Smart Transfer Service
struct StarWarsService: StarWarsServiceType {
    // MARK: - Alias
    typealias Dependencies = HasNetworkManagerType
    
    // MARK: - Properties
    private let dependencies: Dependencies
    
    // MARK: - Initialization
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func getStarWarsCharacter() -> AnyPublisher<[CharacterResponse], Error> {
        dependencies
            .networkManager
            .perform(request: StarWarsRequest.getStarWarsCharacter)
            .eraseToAnyPublisher()
    }
    
    func getImage(url: String) -> AnyPublisher<Data, Error> {
        dependencies
            .networkManager
            .perform(request: StarWarsRequest.getImage(url: url))
            .eraseToAnyPublisher()
    }
}

// MARK: Dependencies
struct StarWarServiceDependencies: HasNetworkManagerType {
    let networkManager: NetworkManagerType = NetworkManager()
}
